output "ecr_repository" {
  value = module.ecr-repository.ecr_repository_url
}

output "app_security_group_id" {
  value = module.app-security-group.id
}

