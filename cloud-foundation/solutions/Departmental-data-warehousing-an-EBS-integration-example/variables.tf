# Copyright © 2022, Oracle and/or its affiliates.
# All rights reserved. Licensed under the Universal Permissive License (UPL), Version 1.0 as shown at https://oss.oracle.com/licenses/upl.


terraform {
  required_version = ">= 0.14.0"
}

variable "tenancy_ocid" {
  type = string
  default = ""
}

variable "region" {
    type = string
    default = ""
}

variable "compartment_id" {
  type = string
  default = ""
}

variable "user_ocid" {
    type = string
    default = ""
}

variable "fingerprint" {
    type = string
    default = ""
}

variable "private_key_path" {
    type = string
    default = ""
}


# Autonomous Database Configuration Variables

variable "adw_cpu_core_count" {
    type = number
    default = 1
}

variable "adw_size_in_tbs" {
    type = number
    default = 1
}

variable "adw_db_name" {
    type = string
    default = "ADWipn"
}

variable "adw_db_workload" {
    type = string
    default = "DW"
}

variable "adw_db_version" {
    type = string
    default = "19c"
}

variable "adw_enable_auto_scaling" {
    type = bool
    default = true
}

variable "adw_is_free_tier" {
    type = bool
    default = false
}

variable "adw_license_model" {
    type = string
    default = "LICENSE_INCLUDED"
}

variable "database_admin_password" {
  type = string
  default = ""
}

variable "database_wallet_password" {
  type = string
  default = ""
}


# Oracle Analytics Cloud Configuration

variable "analytics_instance_feature_set" {
    type    = string
    default = "ENTERPRISE_ANALYTICS"
}

variable "analytics_instance_license_type" {
    type    = string
    default = "LICENSE_INCLUDED"
}

variable "analytics_instance_hostname" {
    type    = string
    default = "AnalyicSD"
}

variable "analytics_instance_idcs_access_token" {
    type    = string
    default = "copy-paste your token instead"
}

variable "analytics_instance_capacity_capacity_type" {
    type    = string
    default = "OLPU_COUNT"
}

variable "analytics_instance_capacity_value" {
    type    = number
    default = 1
}

variable "analytics_instance_network_endpoint_details_network_endpoint_type" {
    type    = string
    default = "public"
}

variable "whitelisted_ips" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "analytics_instance_network_endpoint_details_whitelisted_ips" {
  type = list(string)
  default = ["0.0.0.0/0"]
}


# Data Catalog

variable "datacatalog_display_name" {
    type    = string
    default = "DataCatalogIP"
}


# Bastion Instance variables
# More information regarding shapes can be found here:
# https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm

variable "bastion_shape" {
  default = "VM.Standard2.4"
}

# linux_images = {
#   ap-melbourne-1  = {
#     centos6 = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaas4synyw646enlkqbgunmevfw3npohtccrpam6iqvtljesbtsqdoa"
#     centos7 = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaa3wpbl3xl6jfgk3gat3gnesw7wvafzvbxl2zybh3zclr3lahllilq"
#     oel6    = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaat52asmaafbfz6vdkgmopvbkwsucokrwqmxgdr5qjcwu6zutvic7a"
#     oel7    = "ocid1.image.oc1.ap-melbourne-1.aaaaaaaavpiybmiqoxcohpiih2gasjgqpsiyz4ggylyhhitmrmf3j2ycucrq"
#   }
#   ap-mumbai-1     = {
#     centos6 = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaaorpgj2wcaaawpi3sdisrsz7ahhx6k7yq27bzrcun6ohehvsp5kuq"
#     centos7 = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaafr2lbi3vkymk2os3t3xqg2xp42xfqll7x73rv3j4msfuwwrbxmta"
#     oel6    = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaahkxsdgr2piceahkowh7jmimywdvfe4wdc3ujizzrgmdpuansjlva"
#     oel7    = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaarrsp6bazleeeghz6jcifatswozlqkoffzwxzbt2ilj2f65ngqi6a"
#   }
#   ap-osaka-1      = {
#     centos6 = "ocid1.image.oc1.ap-osaka-1.aaaaaaaausl3ucj5slnzpjr6zc5hulnd7637eqakcscl45zc673fz3repgnq"
#     centos7 = "ocid1.image.oc1.ap-osaka-1.aaaaaaaaws7jyd6nfsd6negf5ojd27m3v7xosspil7mkcnf3wfcbf3w3iq6a"
#     oel6    = "ocid1.image.oc1.ap-osaka-1.aaaaaaaajoqvhi7dd776bch4uspb2xuzzhaoobrt6xh45rs3o4mv3ya4e5tq"
#     oel7    = "ocid1.image.oc1.ap-osaka-1.aaaaaaaafa5rhs2n3dyuncddh5oynk6gisvotvcvch3e6xwplji7phwtbqqa"
#   }
#   ap-seoul-1     = {
#     centos6 = "ocid1.image.oc1.ap-seoul-1.aaaaaaaajfn2tg23h6bspxhn3xlby6f6tsksagemmoaycoylxa5ivbf2prhq"
#     centos7 = "ocid1.image.oc1.ap-seoul-1.aaaaaaaajsolmhhy7xjgfscxb4vpyet6k2sop6wdtwmn3dkc3fy7eyt3m24a"
#     oel6    = "ocid1.image.oc1.ap-seoul-1.aaaaaaaa4rk36ectfyj2psdo3xcatz4z3x7ctber6l74vohqkbyfwoxdz3iq"
#     oel7    = "ocid1.image.oc1.ap-seoul-1.aaaaaaaadrnhec6655uedkshgcklewzikoqcwr65sevbu27z7vzagniihfha"
#   }
#   ap-sydney-1    = {
#     centos6 = "ocid1.image.oc1.ap-sydney-1.aaaaaaaaeevmpmgwugan2qljntoteqihc6ygfycwxui3nigeob7snaikuaiq"
#     centos7 = "ocid1.image.oc1.ap-sydney-1.aaaaaaaayblorjjncrno3r5wh73lzmpu4ioro72oymd4eeu2hu4fsscumqha"
#     oel6    = "ocid1.image.oc1.ap-sydney-1.aaaaaaaav4ooak5wysyydz4aezicqstgx3jxmjanjpdj7jonla3tk3npgzda"
#     oel7    = "ocid1.image.oc1.ap-sydney-1.aaaaaaaaplq4fjdnoooudaqwgzaidh6r3lp3xdhqulx454jivy33t53hokga"
#   }
#   ap-tokyo-1     = {
#     centos6 = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaai2umweqozk36atwr4cxaicukqjomfbueojr74fdbxe74fi75egca"
#     centos7 = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaarkipypzhscxniq3uqr2jqc55maelnt7vgjikemck3k5vl5iabzrq"
#     oel6    = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaadnxbyomirzk3rsp4ctmoi65n4dso3olkyf4pfdymslouoq5jcjha"
#     oel7    = "ocid1.image.oc1.ap-tokyo-1.aaaaaaaa5mpgmnwqwacey5gvczawugmo3ldgrjqnleckmnsokrqytcfkzspa"
#   }
#   ca-montreal-1  = {
#     centos6 = "ocid1.image.oc1.ca-montreal-1.aaaaaaaafwemmq6tz6zwxfz7bvlwb6iyi7y2hzzu2mv54ngrldh6hhnyxama"
#     centos7 = "ocid1.image.oc1.ca-montreal-1.aaaaaaaajxxgx4af4rcudk2avldhbebctl7e5v445ycs35wk6boneut423nq"
#     oel6    = "ocid1.image.oc1.ca-montreal-1.aaaaaaaasm46wajq5kmztlbzqclqohpj3nevbi4ep2zi627xbr4uudnxxpma"
#     oel7    = "ocid1.image.oc1.ca-montreal-1.aaaaaaaaevu23evecil3r23q5illjliinkpyvtkbdq5nsxmcfqypvlewytra"
#   }
#   ca-toronto-1   = {
#     centos6 = "ocid1.image.oc1.ca-toronto-1.aaaaaaaan2fmhw2mcc7nidx6dimfzrkzdln4ckirpfyvcdp4xldnwkrlq43q"
#     centos7 = "ocid1.image.oc1.ca-toronto-1.aaaaaaaabqsazpmiu5xq23pxxw3c4r6ko5rjfewk4mqkm7tgtsq4uc2exxoa"
#     oel6    = "ocid1.image.oc1.ca-toronto-1.aaaaaaaayqaoapktxol6igmw26oi73pdypvwtvzxjc73i5ly4sqj3ghwaafa"
#     oel7    = "ocid1.image.oc1.ca-toronto-1.aaaaaaaai25l5mqlzvhjzxvb5n4ullqu333bmalyyg3ki53vt24yn6ld7pra"
#   }
#   eu-amsterdam-1 = {
#     centos6 = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaa4xufymkiho5dlscdbtvsru5b22knjoxcnnflgo6xloqqodfx2tda"
#     centos7 = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaat32fvq5hsmbljrvy77gr2xel7i3l3oc6g3bcnnd6mimzz5jqa7ka"
#     oel6    = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaacymg54gaxda5hwmf4tdaaxcmnmrfemiziweukau3c2gjqqzf77ga"
#     oel7    = "ocid1.image.oc1.eu-amsterdam-1.aaaaaaaayd4knq4bdh23zqgatgjhoajiz3mx4fy3oy62e5f45ll7trwak5ga"
#   }
#   eu-frankfurt-1 = {
#     centos6 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaf6ej4bn4wzvlocyybqn65x7osycxvobtjkcn7ya4urcsa6ql6rhq"
#     centos7 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaahkaj2rzfdpruxajpy77gohgczstwhygsimohss2plkfslbbh4xfa"
#     oel6    = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaawrdkszzb56yo4nb4k42txyp2yvwusgsbraztcua2b5ebsk5iz7lq"
#     oel7    = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa4cmgko5la45jui5cuju7byv6dgnfnjbxhwqxaei3q4zjwlliptuq"
#   }
#   eu-zurich-1    = {
#     centos6 = "ocid1.image.oc1.eu-zurich-1.aaaaaaaagmybtgdr33vlsaa245sulxmqvasf5pgoppbfkx2qtoonfd6pbwnq"
#     centos7 = "ocid1.image.oc1.eu-zurich-1.aaaaaaaaedzqaa6w2b675og5go54nw2tmfoonqnk2kabhcdcuygbpy7habga"
#     oel6    = "ocid1.image.oc1.eu-zurich-1.aaaaaaaafdub2llzurrq6ti2xff6po2x6ibm3aaabjhesgug6ceo73etquaq"
#     oel7    = "ocid1.image.oc1.eu-zurich-1.aaaaaaaa4nwf5h6nl3u5cdauemg352itja6izecs7ol73z6jftsg4agpdsma"
#   }
#   me-jeddah-1    = {
#     centos6 = "ocid1.image.oc1.me-jeddah-1.aaaaaaaac37rqyxwrl4lw2zcxkrplmkybkgykco2zzw4wbjjzbgzoj4emzxa"
#     centos7 = "ocid1.image.oc1.me-jeddah-1.aaaaaaaa2hphaidibmfn6bomi756tjtb3ncakzroubrdrh4oteiexkgqzqxa"
#     oel6    = "ocid1.image.oc1.me-jeddah-1.aaaaaaaa6ypmt4rwxpi2w3b5jvrzxsw6egopg3ckzhsddbbwjrdri4hyiara"
#     oel7    = "ocid1.image.oc1.me-jeddah-1.aaaaaaaazrvioeng7va7w4qsuqny4jtxbvnxlf5hu7g2twn6rcwdu35u4riq"
#   }
#   sa-saopaulo-1   = {
#     centos6 = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaat6zylwbmjc3nt3opxgr54vjuolezmxmdlkhumdkrnfzjmcalena"
#     centos7 = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaa4jgkrkwd5d6ktzu43mjhri4el2p3gc7hzkkt26uhawjf6xe2s5ra"
#     oel6    = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaaw265lcnl4fottvdoid56arojwyxl57mihcl6g5p5dwwk457ufa6q"
#     oel7    = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaalfracz4kuew4yxvgydpnbitip6qsreaz7kpxlkr4p67ravvi4jnq"
#   }
#   uk-gov-london-1 = {
#     centos6 = "ocid1.image.oc4.uk-gov-london-1.aaaaaaaa3jm7g2knbd42qbmahxcitawva56svefikpjrlfqjdeiir4vhxdmq"
#     centos7 = "ocid1.image.oc4.uk-gov-london-1.aaaaaaaavzplbvr4myylufwebu6556stwm44rhg5b7hzyljyghkzxkrpnntq"
#     oel6    = "ocid1.image.oc4.uk-gov-london-1.aaaaaaaamcvr7kawh4i3sdrlok2kqkfetk573utdq5u4ighhe55r46ddmusq"
#     oel7    = "ocid1.image.oc4.uk-gov-london-1.aaaaaaaaslh4pip7u6iopbpxujy2twi7diqrs6kfvqfhkl27esdadkqa76mq"
#   }
#   uk-london-1     = {
#     centos6 = "ocid1.image.oc1.uk-london-1.aaaaaaaalaq6axfs4t4qibzlbo6mq2ejbij6rnhrdv43ic53yuu6nsziabdq"
#     centos7 = "ocid1.image.oc1.uk-london-1.aaaaaaaalblgx62jnubrhfdt4kawbev4r3r2rord253r5h6b4vdsgvz7uhnq"
#     oel6    = "ocid1.image.oc1.uk-london-1.aaaaaaaapir5bvtsdq6inbebytzb362kkd5tx2iz3qg7i2k4b2vbnejan6uq"
#     oel7    = "ocid1.image.oc1.uk-london-1.aaaaaaaa2uwbd457cd2gtviihmxw7cqfmqcug4ahdg7ivgyzla25pgrn6soa"
#   }
#   us-ashburn-1    = {
#     centos6 = "ocid1.image.oc1.iad.aaaaaaaa2czkuqalinjferx3iszp264xspwnd7xzlfhupxtzc4zdnuxi6bwa"
#     centos7 = "ocid1.image.oc1.iad.aaaaaaaa3n6t4mwilogs7a7dvp64tptstjvivq52yasfjgw64lcbdqf4d3ca"
#     oel6    = "ocid1.image.oc1.iad.aaaaaaaasxwd6pbz6py3shznyfxuxexiatoxse7zyd7tz4tmra27wle6ydwq"
#     oel7    = "ocid1.image.oc1.iad.aaaaaaaavzjw65d6pngbghgrujb76r7zgh2s64bdl4afombrdocn4wdfrwdq"
#   }
#   us-langley-1    = {
#     centos6 = "ocid1.image.oc2.us-langley-1.aaaaaaaa7bgboeixz75owe3fbdmg2pvmysk2rxob6bufkisyin3v27qsdz2q"
#     centos7 = "ocid1.image.oc2.us-langley-1.aaaaaaaa3ryqvptloob45777kvfqsoymukhioddaj5yows526j4cn5enl6aa"
#     oel6    = "ocid1.image.oc2.us-langley-1.aaaaaaaakzg6qr6hpm3jj7x3wyt2ya7bsh5xtvku3hmlysguuaasir6u673a"
#     oel7    = "ocid1.image.oc2.us-langley-1.aaaaaaaauckkms7acrl6to3cuhmv6hfjqwlnoxzuzophaose7pi2sfk4dzna"
#   }
#   us-luke-1       = {
#     centos6 = "ocid1.image.oc2.us-luke-1.aaaaaaaa6woblaikk4fmyciqfwmbvoeukgq2m3jt5rrqyclseehrsawwkpyq"
#     centos7 = "ocid1.image.oc2.us-luke-1.aaaaaaaa4o74g2lmljky7fgx4o5zr3aw7rww7jjkliwbqoxq6yu5vjm23e3a"
#     oel6    = "ocid1.image.oc2.us-luke-1.aaaaaaaajyelyu6k7kzyoxeneyye74ld3osxx53ufeh4a2thrnpub5zi47mq"
#     oel7    = "ocid1.image.oc2.us-luke-1.aaaaaaaadxeycutztmvaeefvilc57lfqool2rlgl2r34juyu4jkbodx2xspq"
#   }
#   us-phoenix-1    = {
#     centos6 = "ocid1.image.oc1.phx.aaaaaaaau6s3kqgtnuxtu2yc7czi2z4ylcn5mhx7igcmhb3ujjaiypcjhozq"
#     centos7 = "ocid1.image.oc1.phx.aaaaaaaak3hatlw7tncpvvatc4t7ihocxfx243ii54m2kuxjlsln4vnspnea"
#     oel6    = "ocid1.image.oc1.phx.aaaaaaaas3h3h5hr3uvfliydhvusoscpqzflewislg4m3ycj6y6y3exvbe3a"
#     oel7    = "ocid1.image.oc1.phx.aaaaaaaacy7j7ce45uckgt7nbahtsatih4brlsa2epp5nzgheccamdsea2yq"
#   }
# }

variable "bation_linux_image" {
  default = "ocid1.image.oc1.iad.aaaaaaaavzjw65d6pngbghgrujb76r7zgh2s64bdl4afombrdocn4wdfrwdq"
}


# ODI Instance variables
# More information regarding shapes can be found here:
# https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm

variable "odi_instance_shape" {
  default = "VM.Standard2.4"
}

variable "adw_username" {
  type = string
  default = "admin"
}

variable "adw_password" {
  type = string
  default = ""
}

variable "odi_vnc_password" {
  type = string
  default = ""
}

variable "odi_schema_prefix" {
  type = string
  default = "odi"
}

variable "odi_schema_password" {
  type = string
  default = ""
}

variable "odi_password" {
  type = string
  default = ""
}

variable "adw_creation_mode" {
  type = bool
  default = true
}

variable "embedded_db" {
  type = bool
  default = false
}

variable "studio_mode" {
  type = string
  default = "ADVANCED"  # "ADVANCED" or "Web"
}

variable "db_tech" {
  type = string
  default = "ADB"
}

variable "studio_name" {
  type = string
  default = "ADVANCED" #  "ADVANCED" ,  "ODI Web Studio Administrator" or "ODI Studio"
}


# Networking variables

# VCN and subnet Variables

variable "vcn_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "service_name" {
  type        = string
  default     = "IonelP"
  description = "A prefix for policies and dynamic groups names - scope: to be unique names not duplicates"
}

# # don't modify any other variables (below) - it may cause that the solution will not work propertly.

variable "use_regional_subnet" {
  type = bool
  default = true
  description = "Indicates use of regional subnets (preferred) instead of AD specific subnets"
}

variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "1.0.0"
}

# # End
