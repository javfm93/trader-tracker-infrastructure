module "ecs-cluster-with-service-and-task" {
  source                      = "../../containers/use-cases/ecs-create-service"
  app_name                    = var.app_name
  app_port                    = var.app_port
  ecr_repository_url          = module.ecr-repository.ecr_repository_url
  ecs_task_execution_role_arn = module.ecs-task-execution-role.arn
  elb_name                    = var.elb_name
  region                      = var.region
  parameters                  = var.ssm_parameters
  cluster_id                  = var.cluster_id
  desired_tasks               = var.desired_tasks
}

module "ecr-repository" {
  source   = "../../containers/modules/ecr/"
  app_name = var.app_name
}

module "ecs-task-execution-role" {
  source     = "../../iam/use-cases/create-task-execution-role-with-ssm-access"
  parameters = var.ssm_parameters
}

module "cloudwatch" {
  source   = "../../cloudwatch/modules/log-group"
  app_name = var.app_name
}

output "ecr-repository" {
  value = module.ecr-repository.ecr_repository_url
}

