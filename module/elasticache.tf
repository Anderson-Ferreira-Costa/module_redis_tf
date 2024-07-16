resource "aws_elasticache_replication_group" "default" {
  replication_group_id       = local.replication_id
  description                = "Elasticache Redis in ${var.project_name}-${var.environment_name}"
  engine                     = var.engine.type
  node_type                  = var.engine.instance
  engine_version             = var.engine.version
  port                       = var.engine.port
  parameter_group_name       = aws_elasticache_parameter_group.default.name
  subnet_group_name          = aws_elasticache_subnet_group.default.name
  security_group_ids         = [aws_security_group.default.id]
  apply_immediately          = var.apply_immediately
  maintenance_window         = var.maintenance_window
  snapshot_window            = local.redis_constant == var.engine.type ? var.snapshot_window : null
  num_cache_clusters         = local.is_cluster_mode ? null : var.engine.num_cache_clusters
  auth_token                 = local.random_password
  transit_encryption_enabled = var.use_password ? true : var.transit_encryption_enabled
  automatic_failover_enabled = local.automatic_failover_enabled
  multi_az_enabled           = local.multi_az_enabled
  num_node_groups            = local.is_cluster_mode ? var.cluster_mode.num_node_groups : null
  replicas_per_node_group    = local.is_cluster_mode ? var.cluster_mode.replicas_per_node_group : null
  tags                       = local.tags
}

resource "aws_elasticache_subnet_group" "default" {
  name       = "subnets-${var.cluster_name}-${var.environment_name}"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_parameter_group" "default" {
  name   = "param-${var.cluster_name}-${var.environment_name}"
  family = var.parameter_group_family
  dynamic "parameter" {
    for_each = local.is_cluster_mode ? concat([{ name = "cluster-enabled", value = "yes" }], var.parameter_group_parameters) : var.parameter_group_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = local.tags
}
