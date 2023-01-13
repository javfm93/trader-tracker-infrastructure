resource "aws_db_subnet_group" "this" {
  name       = lower("${var.db_name}-subnet-group")
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "this" {
  db_name                = var.db_name
  instance_class         = var.db_instance_class
  allocated_storage      = var.storage
  engine                 = var.engine.name
  engine_version         = var.engine.version
  publicly_accessible    = false
  vpc_security_group_ids = var.security_group_ids
  username               = var.username
  password               = var.password
  port                   = var.port
  db_subnet_group_name   = aws_db_subnet_group.this.name
}

output "endpoint" {
  value = aws_db_instance.this.endpoint
}