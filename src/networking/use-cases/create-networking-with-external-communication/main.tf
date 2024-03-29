# one vpc per region, can have multiple servers per region (in different available zones)
# lb in the public subnet and the servers in the private

module "vpc" {
  source         = "../../components/vpc"
  app_name       = var.app_name
  vpc_cidr_block = var.vpc_cidr_block
}

module "public-subnets" {
  source      = "../../components/subnet"
  is_public   = true
  region      = var.region
  vpc_id      = module.vpc.id
  vpc_subnets = var.vpc_public_subnets
}

module "private-subnets" {
  source      = "../../components/subnet"
  is_public   = false
  region      = var.region
  vpc_id      = module.vpc.id
  vpc_subnets = var.vpc_private_subnets
}

module "internet-gateway" {
  source            = "../../components/internet-gateway"
  app_name          = var.app_name
  public_subnets_id = module.public-subnets.ids
  vpc_id            = module.vpc.id
}

// the nat is necessary to register ec2 instances into the cluster
module "nat" {
  source             = "../../components/nat"
  app_name           = var.app_name
  private_subnets_id = module.private-subnets.ids
  public_subnet_id   = module.public-subnets.ids[0]
  vpc_id             = module.vpc.id
}

output "vpc_id" {
  value = module.vpc.id
}

output "public_subnets_ids" {
  value = module.public-subnets.ids
}


output "private_subnets_ids" {
  value = module.private-subnets.ids
}