output "public_alb_dns" {
  value = module.public-alb.dns
}

output "public_alb_name" {
  value = module.public-alb.name
}

output "public_alb_listener_arn" {
  value = module.public-alb.listener_arn
}

output "private_alb_dns" {
  value = module.private-alb.dns
}

output "private_alb_name" {
  value = module.private-alb.name
}

output "private_alb_listener_arn" {
  value = module.private-alb.listener_arn
}

output "private_alb_security_group_id" {
  value = module.private-alb-security-group.id
}