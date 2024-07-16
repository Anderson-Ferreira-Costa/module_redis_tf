module "redis" {
  source           = "./module/"
  region           = var.region
  project_name     = var.project_name
  cluster_name     = var.cluster_name
  environment_name = var.environment_name
  engine = {
    type               = "redis"
    version            = var.redis_version
    instance           = var.redis_instance
    num_cache_clusters = var.redis_num_cache_clusters
    port               = 6379
  }

  cluster_mode_enabled = var.cluster_mode_enabled
  cluster_mode = {
    replicas_per_node_group = var.redis_replicas_per_node_group
    num_node_groups         = var.redis_num_node_groups
  }

  vpc_id                 = var.vpc_id
  subnet_ids             = var.subnet_ids
  parameter_group_family = var.parameter_group_family
  tags                   = local.tags
}

