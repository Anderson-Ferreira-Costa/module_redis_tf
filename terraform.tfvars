region           = "us-east-1"
project_name     = "saude"
environment_name = "dev"

cluster_name             = "redis"
redis_version            = "7.1"
parameter_group_family   = "redis7"
redis_instance           = "cache.t4g.micro"
redis_num_cache_clusters = 3

cluster_mode_enabled          = true
redis_replicas_per_node_group = 1
redis_num_node_groups         = 2

vpc_id = "vpc-0c6a2040f6a986bd2"
subnet_ids = [
  "subnet-0892d92ce423af7b0",
  "subnet-06db1b0c355505c89",
  "subnet-0596f718037d7b1a2"
]