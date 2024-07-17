## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.27 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_redis"></a> [redis](#module\_redis) | ./module/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_mode_enabled"></a> [cluster\_mode\_enabled](#input\_cluster\_mode\_enabled) | (Optional) Enable/disable cluster mode | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | (Required) This will be the name of the cluster. | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | (Required) The name of the environment. must be `dev`, `hml`, `prd`. | `string` | n/a | yes |
| <a name="input_log_retention"></a> [log\_retention](#input\_log\_retention) | (Optional) Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653. If you select 0, the events in the log group are always retained and never expire. | `number` | `14` | no |
| <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family) | (Required) The family of the ElastiCache parameter group | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | (Required) Name of the project. | `string` | n/a | yes |
| <a name="input_redis_instance"></a> [redis\_instance](#input\_redis\_instance) | (Optional) Instance size | `string` | `"cache.t4g.medium"` | no |
| <a name="input_redis_num_cache_clusters"></a> [redis\_num\_cache\_clusters](#input\_redis\_num\_cache\_clusters) | (Optional) Number of cache cluster | `number` | `1` | no |
| <a name="input_redis_num_node_groups"></a> [redis\_num\_node\_groups](#input\_redis\_num\_node\_groups) | (Optional) Number of node groups | `number` | `2` | no |
| <a name="input_redis_replicas_per_node_group"></a> [redis\_replicas\_per\_node\_group](#input\_redis\_replicas\_per\_node\_group) | (Optional) Replicas per node group | `number` | `1` | no |
| <a name="input_redis_version"></a> [redis\_version](#input\_redis\_version) | (Optional) Redis version. default 7.1 | `string` | `"7.1"` | no |
| <a name="input_region"></a> [region](#input\_region) | (Required) The region This is the region where the resources will be applied. | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Lista de IDs de subnets. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) Map of tags to assign to the resource. If configured with a provider. | `map(any)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Vpc id. | `string` | n/a | yes |

## Outputs

No outputs.
