locals {
  redis_constant             = "redis"
  elasticache_service_name   = "elasticache"
  replication_id             = "cluster-${var.cluster_name}-${var.environment_name}"
  is_cluster_mode            = var.cluster_mode_enabled
  random_password            = var.use_password ? random_password.password.result : null
  automatic_failover_enabled = local.is_cluster_mode || var.engine.num_cache_clusters > 1 ? true : false
  multi_az_enabled           = local.is_cluster_mode || var.engine.num_cache_clusters > 1 ? true : false

  tags = merge({
    Environment = var.environment_name
    Cluster     = var.cluster_name
    Project     = var.project_name
  }, var.tags)
}

resource "random_password" "password" {
  length  = var.password_length
  special = false
}

resource "random_id" "server" {
  byte_length = 8
}
