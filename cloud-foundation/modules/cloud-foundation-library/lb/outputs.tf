# Copyright © 2021, Oracle and/or its affiliates.
# All rights reserved. Licensed under the Universal Permissive License (UPL), Version 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "BackendsetNames" {
  value = [ for b in oci_load_balancer_backend_set.lb-backendset : b.name]
}

output "SSLHeadersNames" {
  value = [ for b in oci_load_balancer_rule_set.SSL_headers : b.name]
}

output "CertificateNames" {
  value = [ for b in oci_load_balancer_certificate.demo_certificate : b.certificate_name]
}

output "load_balancer_id" {
  value = element(coalescelist([for b in oci_load_balancer_load_balancer.loadbalancer : b.id], tolist([""])), 0)
}

output "load_balancer_IP" {
  value = [for b in oci_load_balancer_load_balancer.loadbalancer : b.ip_addresses]
}