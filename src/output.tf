output "vpc_id" {
  value = module.networking-and-infrastructure.vpc_id
}

output "public_subnets_ids" {
  value = module.networking-and-infrastructure.public_subnets_ids
}

output "private_subnets_ids" {
  value = module.networking-and-infrastructure.private_subnets_ids
}

output "cluster_id" {
  value = module.networking-and-infrastructure.cluster_id
}

output "private_alb" {
  value = module.networking-and-infrastructure.private_alb
}

output "public_alb" {
  value = module.networking-and-infrastructure.public_alb
}