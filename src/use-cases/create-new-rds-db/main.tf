resource "random_string" "username" {
  length  = 12
  special = false
  upper   = true
}

resource "random_string" "password" {
  length  = 32
  upper   = true
  numeric = true
  special = false
}

module "db-security-group" {
  source        = "../../compute/modules/security-group"
  app_name      = var.app_name
  name          = "db"
  description   = "Security Group for db"
  ingress_rules = [
    {
      description     = "allow sg to access db"
      from_port       = var.db_port
      to_port         = var.db_port
      protocol        = "tcp"
      security_groups = var.allowed_security_group_ids
      cidr_blocks     = null
    }
  ]
  vpc_id = var.vpc_id
}

// only on 1 availability zone due to the free tier
module "database" {
  source             = "../../storage/modules/rds"
  db_name            = var.db_name
  db_instance_class  = var.db_instance_class
  storage            = var.storage
  engine             = var.engine
  security_group_ids = [module.db-security-group.id]
  username           = random_string.username.result
  password           = random_string.password.result
  port               = var.db_port
}

module "database-username-parameter" {
  source = "../../storage/use-cases/create-secure-parameter"
  name   = "/${var.app_name}/storage/${var.engine.name}/username"
  value  = random_string.username.result
}

module "database-password-parameter" {
  source = "../../storage/use-cases/create-secure-parameter"
  name   = "/${var.app_name}/database/${var.engine.name}/password"
  value  = random_string.password.result
}

output "endpoint" {
  value = module.database.endpoint
}

output "credentials" {
  value = "Credentials are found in ssm under ${module.database-username-parameter.name}"
}