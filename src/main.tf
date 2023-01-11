// here we need to receive the state of the pieces that are common, vpc, subnets, elb, cluster_name
// also, we can do the same but with ssm parameters, better idea!!

module "networking" {
  source              = "./networking/use-cases/create-networking-with-external-communication"
  app_name            = var.cluster_name
  region              = var.region
  vpc_cidr_block      = var.vpc_cidr_block
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets  = var.vpc_public_subnets
}

module "create-load-balancers" {
  source             = "./compute/use-cases/create-load-balancers"
  app_name           = var.cluster_name
  app_port           = var.app_port
  vpc_id             = module.networking.vpc_id
  public_subnet_ids  = module.networking.public_subnets_ids
  private_subnet_ids = module.networking.private_subnets_ids
  private_alb_config = var.private_alb_config
  public_alb_config  = var.public_alb_config
}

module "ecs-cluster" {
  source       = "./containers/modules/ecs"
  cluster_name = var.cluster_name
}
