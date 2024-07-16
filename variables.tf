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

variable "log_retention" {
  type        = number
  description = "(Optional) Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653. If you select 0, the events in the log group are always retained and never expire."
  default     = 14
}

variable "tags" {
  type        = map(any)
  description = " (Optional) Map of tags to assign to the resource. If configured with a provider."
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "Vpc id."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Lista de IDs de subnets."

  validation {
    condition     = length(var.subnet_ids) >= 3
    error_message = "Subnet ids require minimum of 3 subnets."
  }
}

#################
##   Redis
#################
variable "redis_replicas_per_node_group" {
  type        = number
  description = "(Optional) Replicas per node group"
  default     = 1
}

variable "redis_instance" {
  type        = string
  description = "(Optional) Instance size"
  default     = "cache.t4g.medium"
}

variable "redis_num_node_groups" {
  type        = number
  description = "(Optional) Number of node groups"
  default     = 2
}

variable "redis_version" {
  type        = string
  description = "(Optional) Redis version. default 7.1"
  default     = "7.1"
}

variable "parameter_group_family" {
  type        = string
  description = "(Required) The family of the ElastiCache parameter group"
}

variable "redis_num_cache_clusters" {
  type        = number
  description = "(Optional) Number of cache cluster"
  default     = 1
}

variable "cluster_mode_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Enable/disable cluster mode"
}
