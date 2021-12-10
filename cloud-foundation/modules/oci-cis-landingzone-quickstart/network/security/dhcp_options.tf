# Copyright © 2021, Oracle and/or its affiliates.
# All rights reserved. Licensed under the Universal Permissive License (UPL), Version 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_core_dhcp_options" "these" {

  for_each = var.dhcp_options

    compartment_id = each.value.compartment_id
    vcn_id         = each.value.vcn_id
    display_name   = each.key

  // required
  options {
    type          = each.value.options.type
    server_type   = each.value.options.server_type
  }

  defined_tags = each.value.defined_tags
  freeform_tags = each.value.freeform_tags

}
