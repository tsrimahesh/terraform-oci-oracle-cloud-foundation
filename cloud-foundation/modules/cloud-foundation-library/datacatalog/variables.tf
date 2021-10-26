// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "datacatalog_params" {
  type = map(object({
    compartment_id       = string
    catalog_display_name = string
    defined_tags         = map(string)
  }))
}
