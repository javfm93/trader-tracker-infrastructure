output "vpc_id" {
  value = module.networking.vpc_id
}
output "cluster_id" {
  value = module.ecs-cluster.id
}

output "elb_name" {
  value = module.create-ec2-for-ecs.elb_name
}

output "elb_dns_name" {
  value = module.create-ec2-for-ecs.elb_dns_name
}