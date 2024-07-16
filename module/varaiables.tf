variable "project_name" {
  type        = string
  description = "(Required) Name of the project."
}

variable "cluster_name" {
  type        = string
  description = "(Required) This will be the name of the cluster."
}

variable "region" {
  type        = string
  description = "(Required) The region This is the region where the resources will be applied."
}

variable "environment_name" {
  type        = string
  description = "(Required) The name of the environment. must be `dev`, `hml`, `prd`."

  validation {
    condition     = contains(["dev", "hml", "prd"], var.environment_name)
    error_message = "Valid values for var: environment_name are (dev, hml, prd)."
  }
}

variable "engine" {
  type = object({
    type : string
    version : string
    instance : string
    num_cache_clusters : number
    port : number
  })
}

variable "cluster_mode_enabled" {
  type    = bool
  default = false
}

variable "cluster_mode" {
  type = object({
    replicas_per_node_group : number
    num_node_groups : number
  })
}

variable "multi_az_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether to enable Multi-AZ Support for the replication group. If true, automatic_failover_enabled must also be enabled. Defaults to false."
}

variable "automatic_failover_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If enabled, num_cache_clusters must be greater than 1. Must be enabled for Redis (cluster mode enabled) replication groups. Defaults to false."
}

variable "transit_encryption_enabled" {
  type    = bool
  default = true
}

variable "rest_encryption_enable" {
  type    = bool
  default = true
}

variable "rest_encryption_kms_id" {
  type    = string
  default = ""
}

variable "parameter_group_family" {
  type = string
}

variable "parameter_group_parameters" {
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "vpc_id" {
  type        = string
  description = "(Required) Vpc id"
}

variable "subnet_ids" {
  type        = list(string)
  description = "(Required) List of subnet ids"

  validation {
    condition     = length(var.subnet_ids) >= 3
    error_message = "Subnet ids require minimum of 3 subnets."
  }
}

variable "use_password" {
  type    = bool
  default = true
}

variable "password_length" {
  type        = number
  description = "(Optional) Unless `use_password` is `true`. Specifies the length of password. Default 32"
  default     = 32
}

variable "password_rotate_after_days" {
  type    = number
  default = 30
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "apply_immediately" {
  type    = bool
  default = true
}

variable "maintenance_window" {
  type    = string
  default = ""
}

variable "snapshot_window" {
  type    = string
  default = ""
}

variable "log_retention" {
  type        = number
  description = "(Optional) Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653. If you select 0, the events in the log group are always retained and never expire."
  default     = 14
}
