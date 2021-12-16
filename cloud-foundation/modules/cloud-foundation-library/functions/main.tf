// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_functions_application" "this" {
  for_each       = var.app_params
  compartment_id = each.value.compartment_id
  subnet_ids     = each.value.subnet_ids
  display_name   = each.value.display_name
  defined_tags   = each.value.defined_tags
}


data "oci_functions_applications" "existing" {
  for_each = var.app_params
  compartment_id = each.value.compartment_id
  id       = oci_functions_application.this[each.value.display_name].id
}

# Terraform will take 40 minutes after destroying a function due to a known service issue.
# please refer: https://docs.cloud.oracle.com/iaas/Content/Functions/Tasks/functionsdeleting.htm
resource "oci_functions_function" "this" {
  for_each           = var.fn_params
  application_id     = oci_functions_application.this[each.value.function_app].id
  display_name       = each.value.display_name
  image              = each.value.image
  memory_in_mbs      = "256"
  defined_tags       = each.value.defined_tags
}

data "oci_functions_functions" "existing" {
  for_each       = var.fn_params
  application_id = oci_functions_application.this[each.value.function_app].id
}

