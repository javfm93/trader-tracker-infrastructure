resource "aws_db_instance" "this" {
  db_name                = var.app_name
  instance_class         = var.db_instance_class
  allocated_storage      = var.storage
  engine                 = var.engine.name
  engine_version         = var.engine.version
  publicly_accessible    = false
  vpc_security_group_ids = var.security_group_ids
  username               = var.username
  password               = var.password
}