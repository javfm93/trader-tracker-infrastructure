module "public-alb" {
  source          = "../../components/alb"
  app_name        = var.app_name
  subnets         = var.public_subnet_ids
  private         = false
  security_groups = [module.public-alb-security-group.id]
}

module "public-alb-security-group" {
  source        = "../../components/security-group"
  name          = "public-alb"
  description   = "public alb security group"
  app_name      = var.app_name
  vpc_id        = var.vpc_id
  ingress_rules = var.public_alb_config.ingress_rules
}

module "private-alb" {
  source          = "../../components/alb"
  app_name        = var.app_name
  subnets         = var.private_subnet_ids
  private         = true
  security_groups = [module.private-alb-security-group.id]
}

module "private-alb-security-group" {
  source        = "../../components/security-group"
  name          = "private-alb"
  description   = "private alb security group"
  app_name      = var.app_name
  vpc_id        = var.vpc_id
  ingress_rules = var.private_alb_config.ingress_rules
}