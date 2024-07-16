resource "aws_secretsmanager_secret" "default" {
  count = var.use_password ? 1 : 0
  name  = "Secret-${var.cluster_name}-${var.project_name}-${var.environment_name}-${random_id.server.id}"
  tags  = local.tags
}

resource "aws_secretsmanager_secret_version" "default" {
  count         = var.use_password ? 1 : 0
  secret_id     = aws_secretsmanager_secret.default[0].id
  secret_string = jsonencode({ "password" = local.random_password })
}
