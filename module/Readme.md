## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_parameter_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_replication_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_secretsmanager_secret.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [random_id.server](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | n/a | `bool` | `true` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | (Optional) Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If enabled, num\_cache\_clusters must be greater than 1. Must be enabled for Redis (cluster mode enabled) replication groups. Defaults to false. | `bool` | `false` | no |
| <a name="input_cluster_mode"></a> [cluster\_mode](#input\_cluster\_mode) | n/a | <pre>object({<br>    replicas_per_node_group : number<br>    num_node_groups : number<br>  })</pre> | n/a | yes |
| <a name="input_cluster_mode_enabled"></a> [cluster\_mode\_enabled](#input\_cluster\_mode\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | (Required) This will be the name of the cluster. | `string` | n/a | yes |
| <a name="input_engine"></a> [engine](#input\_engine) | n/a | <pre>object({<br>    type : string<br>    version : string<br>    instance : string<br>    num_cache_clusters : number<br>    port : number<br>  })</pre> | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | (Required) The name of the environment. must be `dev`, `hml`, `prd`. | `string` | n/a | yes |
| <a name="input_log_retention"></a> [log\_retention](#input\_log\_retention) | (Optional) Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653. If you select 0, the events in the log group are always retained and never expire. | `number` | `14` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | n/a | `string` | `""` | no |
| <a name="input_multi_az_enabled"></a> [multi\_az\_enabled](#input\_multi\_az\_enabled) | (Optional) Specifies whether to enable Multi-AZ Support for the replication group. If true, automatic\_failover\_enabled must also be enabled. Defaults to false. | `bool` | `false` | no |
| <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family) | n/a | `string` | n/a | yes |
| <a name="input_parameter_group_parameters"></a> [parameter\_group\_parameters](#input\_parameter\_group\_parameters) | n/a | <pre>list(object({<br>    name  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_password_length"></a> [password\_length](#input\_password\_length) | (Optional) Unless `use_password` is `true`. Specifies the length of password. Default 32 | `number` | `32` | no |
| <a name="input_password_rotate_after_days"></a> [password\_rotate\_after\_days](#input\_password\_rotate\_after\_days) | n/a | `number` | `30` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | (Required) Name of the project. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | (Required) The region This is the region where the resources will be applied. | `string` | n/a | yes |
| <a name="input_rest_encryption_enable"></a> [rest\_encryption\_enable](#input\_rest\_encryption\_enable) | n/a | `bool` | `true` | no |
| <a name="input_rest_encryption_kms_id"></a> [rest\_encryption\_kms\_id](#input\_rest\_encryption\_kms\_id) | n/a | `string` | `""` | no |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | n/a | `string` | `""` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | (Required) List of subnet ids | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_use_password"></a> [use\_password](#input\_use\_password) | n/a | `bool` | `true` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | (Required) Vpc id | `string` | n/a | yes |

## Outputs

No outputs.
