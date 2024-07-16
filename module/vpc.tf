data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_security_group" "default" {
  name   = "${var.cluster_name}-${var.environment_name}-redis-sg"
  vpc_id = data.aws_vpc.selected.id

  ingress {
    from_port = var.engine.port
    to_port   = var.engine.port
    protocol  = "tcp"

    cidr_blocks = [
      data.aws_vpc.selected.cidr_block,
    ]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = local.tags
}
