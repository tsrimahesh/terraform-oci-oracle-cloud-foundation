locals {
  useHttpsListenerCount = var.add_load_balancer ? 1:0
  health_check_url_path = var.is_idcs_selected?"/cloudgate":"/"
}

module "wls-lb" {

  source = "../../../../../../cloud-foundation/modules/cloud-foundation/lb"
   
   lb-params = {for x in range(var.lbCount) : "${var.name}-${x}" => {
    shape          = "flexible"
    compartment_id = var.compartment_ocid
    subnet_ids = var.subnet_ocids
    maximum_bandwidth_in_mbps = var.lb_max_bandwidth
    minimum_bandwidth_in_mbps = var.lb_min_bandwidth
    display_name  = "${var.service_name_prefix}-lb"
    is_private    = var.is_private
    defined_tags  = var.defined_tags
    freeform_tags = var.freeform_tags
    }
   }
    lb-backendset-params = {empty={name="", load_balancer_id="", policy="", port="", protocol="",response_body_regex="", url_path="", return_code=""}}
    lb-listener-https-params = {empty={load_balancer_id = "", name = "", default_backend_set_name = "", port  = "", protocol = "", rule_set_names=[""], idle_timeout_in_seconds="",certificate_name="",verify_peer_certificate=""}}
    lb-backend-params = {empty={load_balancer_id="", backendset_name="",ip_address="",port="",backup="", drain="", offline="", weight=""}}
    SSL_headers-params = {empty={load_balancer_id="", name="", SSLitems=[{item={action="",header="",value=""}}],countSSL=0}}
    demo_certificate-params = {empty={certificate_name = "", load_balancer_id = "", public_certificate = "", private_key = ""}}  
}

module "wls-lb-backendset" {

  source = "../../../../../../cloud-foundation/modules/cloud-foundation/lb"

  lb-backendset-params = {for x in range(var.lbCount) : "${var.lb_backendset_name}-${x}" => {
    name             = var.lb_backendset_name
    load_balancer_id = module.wls-lb.load_balancer_id
    policy           = var.lb_policy
    port                = var.is_idcs_selected? var.idcs_cloudgate_port : var.wls_ms_port
    protocol            = var.lb-protocol
    response_body_regex = ".*"
    url_path            = local.health_check_url_path
    return_code         = var.return_code
   }
  }
  lb-params = {empty={shape="", compartment_id="", subnet_ids=[""], maximum_bandwidth_in_mbps="", minimum_bandwidth_in_mbps="",display_name="", is_private="",defined_tags={}, freeform_tags={}}}
  lb-listener-https-params = {empty={load_balancer_id = "", name = "", default_backend_set_name = "", port  = "", protocol = "", rule_set_names=[""], idle_timeout_in_seconds="",certificate_name="",verify_peer_certificate=""}}
  lb-backend-params = {empty={load_balancer_id="", backendset_name="",ip_address="",port="",backup="", drain="", offline="", weight=""}}
  SSL_headers-params = {empty={load_balancer_id="", name="", SSLitems=[{item={action="",header="",value=""}}],countSSL=0}}
  demo_certificate-params = {empty={certificate_name = "", load_balancer_id = "", public_certificate = "", private_key = ""}}
}

module "wls-lb-listener-https" {

  source = "../../../../../../cloud-foundation/modules/cloud-foundation/lb"

  lb-listener-https-params = { for x in range(local.useHttpsListenerCount) : "https-${x}" => {
    load_balancer_id         = module.wls-lb.load_balancer_id
    name                     = "https"
    default_backend_set_name = module.wls-lb-backendset.BackendsetNames[x]
    port                     = var.lb-https-lstr-port
    protocol                 = var.lb-protocol
    rule_set_names           = [module.wls-SSL_headers.SSLHeadersNames[x]]
    idle_timeout_in_seconds = "10"
    certificate_name = module.wls-lb-demo_certificate.CertificateNames[x]
    verify_peer_certificate = false
  }
}
  lb-params = {empty={shape="", compartment_id="", subnet_ids=[""], maximum_bandwidth_in_mbps="", minimum_bandwidth_in_mbps="",display_name="", is_private="",defined_tags={}, freeform_tags={}}}
  lb-backendset-params = {empty={name="", load_balancer_id="", policy="", port="", protocol="",response_body_regex="", url_path="", return_code=""}}
  lb-backend-params = {empty={load_balancer_id="", backendset_name="",ip_address="",port="",backup="", drain="", offline="", weight=""}}
  SSL_headers-params = {empty={load_balancer_id="", name="", SSLitems=[{item={action="",header="",value=""}}],countSSL=0}}
  demo_certificate-params = {empty={certificate_name = "", load_balancer_id = "", public_certificate = "", private_key = ""}}
}

module "wls-lb-backend" {

  source = "../../../../../../cloud-foundation/modules/cloud-foundation/lb"

    lb-backend-params = { for x in range(var.add_load_balancer ?var.numWLSInstances:0) : "backend-params-${x}" => {
      load_balancer_id = module.wls-lb.load_balancer_id
      backendset_name  = module.wls-lb-backendset.BackendsetNames[0]
      ip_address       = var.instance_private_ips[x]
      port             = var.is_idcs_selected? var.idcs_cloudgate_port : var.wls_ms_port
      backup           = false
      drain            = false
      offline          = false
      weight           = var.policy_weight

    }
}
  lb-params = {empty={shape="", compartment_id="", subnet_ids=[""], maximum_bandwidth_in_mbps="", minimum_bandwidth_in_mbps="",display_name="", is_private="",defined_tags={}, freeform_tags={}}}
  lb-backendset-params = {empty={name="", load_balancer_id="", policy="", port="", protocol="",response_body_regex="", url_path="", return_code=""}}
  lb-listener-https-params = {empty={load_balancer_id = "", name = "", default_backend_set_name = "", port  = "", protocol = "", rule_set_names=[""], idle_timeout_in_seconds="",certificate_name="",verify_peer_certificate=""}}
  SSL_headers-params = {empty={load_balancer_id="", name="", SSLitems=[{item={action="",header="",value=""}}], countSSL=0}}
  demo_certificate-params = {empty={certificate_name = "", load_balancer_id = "", public_certificate = "", private_key = ""}}
}

module "wls-SSL_headers" {

  source = "../../../../../../cloud-foundation/modules/cloud-foundation/lb"

    SSL_headers-params = { for x in range(local.useHttpsListenerCount) : "SSLHeaders-${x}" => {
      load_balancer_id = module.wls-lb.load_balancer_id
      name             = "SSLHeaders"
      SSLitems = [{item={
        action = "ADD_HTTP_REQUEST_HEADER"
        header = "WL-Proxy-SSL"
        value  = "true"
      }},
      {item={
        action = "ADD_HTTP_REQUEST_HEADER"
        header = "is_ssl"
        value  = "ssl"
      }}]
      countSSL = 2
    }
}
  lb-params = {empty={shape="", compartment_id="", subnet_ids=[""], maximum_bandwidth_in_mbps="", minimum_bandwidth_in_mbps="",display_name="", is_private="",defined_tags={}, freeform_tags={}}}
  lb-backendset-params = {empty={name="", load_balancer_id="", policy="", port="", protocol="",response_body_regex="", url_path="", return_code=""}}
  lb-listener-https-params = {empty={load_balancer_id = "", name = "", default_backend_set_name = "", port  = "", protocol = "", rule_set_names=[""], idle_timeout_in_seconds="",certificate_name="",verify_peer_certificate=""}}
  lb-backend-params = {empty={load_balancer_id="", backendset_name="",ip_address="",port="",backup="", drain="", offline="", weight=""}}
  demo_certificate-params = {empty={certificate_name = "", load_balancer_id = "", public_certificate = "", private_key = ""}}
}

module "wls-lb-demo_certificate" {

  source = "../../../../../../cloud-foundation/modules/cloud-foundation/lb"
    
    demo_certificate-params = { for x in range(var.lbCount) : "${var.lb_certificate_name}-${x}" => {

      certificate_name = var.lb_certificate_name
      load_balancer_id = module.wls-lb.load_balancer_id

      public_certificate = var.public_certificate.cert_pem
      private_key        = var.private_key.private_key_pem
    }
}
  lb-params = {empty={shape="", compartment_id="", subnet_ids=[""], maximum_bandwidth_in_mbps="", minimum_bandwidth_in_mbps="",display_name="", is_private="",defined_tags={}, freeform_tags={}}}
  lb-backendset-params = {empty={name="", load_balancer_id="", policy="", port="", protocol="",response_body_regex="", url_path="", return_code=""}}
  lb-listener-https-params = {empty={load_balancer_id = "", name = "", default_backend_set_name = "", port  = "", protocol = "", rule_set_names=[""], idle_timeout_in_seconds="",certificate_name="",verify_peer_certificate=""}}
  lb-backend-params = {empty={load_balancer_id="", backendset_name="",ip_address="",port="",backup="", drain="", offline="", weight=""}}
  SSL_headers-params = {empty={load_balancer_id="", name="", SSLitems=[{item={action="",header="",value=""}}],countSSL=0}}
}

