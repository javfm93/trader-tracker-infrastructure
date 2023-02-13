module "networking-and-infrastructure" {
  source              = "./use-cases/L1-core/create-networking-for-ecs-cluster"
  region              = var.region
  vpc_cidr_block      = var.vpc_cidr_block
  vpc_private_subnets = var.vpc_private_subnets
  vpc_public_subnets  = var.vpc_public_subnets
  app_port            = var.app_port
  private_alb_config  = var.private_alb_config
  public_alb_config   = var.public_alb_config
  cluster_name        = var.cluster_name
  cidr_blocks         = var.cidr_blocks
  ecs_ami             = var.ecs_ami
  instance_type       = var.instance_type
}
