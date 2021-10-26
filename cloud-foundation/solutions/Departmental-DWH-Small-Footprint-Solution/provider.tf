# Copyright © 2021, Oracle and/or its affiliates.
# All rights reserved. Licensed under the Universal Permissive License (UPL), Version 1.0 as shown at https://oss.oracle.com/licenses/upl.

terraform {
  required_providers {
    oci = {
      version = ">= 4.37.0"
      source = "hashicorp/oci"
    }
  }
}
