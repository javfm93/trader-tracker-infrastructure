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

module "create-ec2-for-ecs" {
  source                      = "./compute/use-cases/create-ec2-for-ecs"
  app_name                    = var.cluster_name
  app_port                    = var.app_port
  ec2_iam_instance_profile_id = module.ec2-role.instance_profile_id
  public_key_path             = ".ssh/${var.cluster_name}-key_pair.pub"
  vpc_id                      = module.networking.vpc_id
  region                      = var.region
  public_subnets_id           = module.networking.public_subnets_ids
}

module "ec2-role" {
  source = "./iam/use-cases/create-ec2-for-ecs-role"
}

module "ecs-cluster" {
  source       = "./containers/modules/ecs"
  cluster_name = var.cluster_name
}
