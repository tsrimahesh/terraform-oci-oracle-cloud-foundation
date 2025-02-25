# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "dbcs_params" {
  description = "DBCS object parameters."
  type        = map(object({
    compartment_id          = string
    subnet_id               = string
    availability_domain     = string
    db_version              = string
    display_name            = string
    disk_redundancy         = string
    shape                   = string
    ssh_public_key          = string
    hostname                = string
    db_edition              = string
    db_admin_password       = string
    db_name                 = string
    db_workload             = string
    pdb_name                = string
    license_model           = string
    enable_auto_backup      = bool
    data_storage_size_in_gb = number
    cpu_core_count          = number
    node_count              = number
  }))
  default = {}
}