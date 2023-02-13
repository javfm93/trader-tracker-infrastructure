output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnets_ids" {
  value = module.networking.public_subnets_ids
}

output "private_subnets_ids" {
  value = module.networking.private_subnets_ids
}

output "cluster_id" {
  value = module.ecs-cluster.id
}

output "private_alb" {
  value = {
    listener_arn      = module.create-load-balancers.private_alb_listener_arn
    security_group_id = module.create-load-balancers.private_alb_security_group_id
  }
}

output "public_alb" {
  value = {
    listener_arn      = module.create-load-balancers.public_alb_listener_arn
    security_group_id = module.create-load-balancers.public_alb_security_group_id
    dns               = module.create-load-balancers.public_alb_dns
  }
}