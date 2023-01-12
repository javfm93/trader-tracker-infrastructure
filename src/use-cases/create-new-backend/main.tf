module "add-target-group-to-alb" {
  source           = "../../compute/use-cases/add-target-group-to-alb"
  alb_listener_arn = var.alb.listener_arn
  app_name         = var.app_name
  target_group     = var.app_target_group
  vpc_id           = var.vpc_id
}

module "ecs-cluster-with-service-and-task" {
  source                      = "../../containers/use-cases/ecs-create-service"
  app_name                    = var.app_name
  app_port                    = var.app_port
  ecr_repository_url          = module.ecr-repository.ecr_repository_url
  ecs_task_execution_role_arn = module.ecs-task-execution-role.arn
  target_group_arn            = module.add-target-group-to-alb.target_group_arn
  region                      = var.region
  parameters                  = var.ssm_parameters
  cluster_id                  = var.cluster_id
  desired_tasks               = var.desired_tasks
}

module "ec2-role" {
  source   = "../../iam/use-cases/create-ec2-for-ecs-role"
  app_name = var.app_name
}

module "key-pair" {
  source          = "../../compute/modules/key-pairs"
  app_name        = var.app_name
  public_key_path = var.public_key_path
}

module "app-security-group" {
  source        = "../../compute/modules/security-group"
  name          = "app"
  description   = "app security group"
  app_name      = var.app_name
  ingress_rules = local.allow_ssh_and_elb_ingress_rules
  vpc_id        = var.vpc_id
}

module "autoscaling" {
  source                  = "../../compute/modules/autoscaling"
  app_name                = var.app_name
  cluster_name            = var.cluster_name
  app_port                = var.app_port
  iam_instance_profile_id = module.ec2-role.instance_profile_id
  key_pair_name           = module.key-pair.name
  security_groups_id      = [module.app-security-group.id]
  ami                     = var.ami
  instance_type           = var.instance_type
  region                  = var.region
  subnets_id              = var.subnets_id
  target_group_arns       = [module.add-target-group-to-alb.target_group_arn]
}

module "ecr-repository" {
  source   = "../../containers/modules/ecr/"
  app_name = var.app_name
}

module "ecs-task-execution-role" {
  source     = "../../iam/use-cases/create-task-execution-role-with-ssm-access"
  parameters = var.ssm_parameters
  app_name   = var.app_name
}

module "cloudwatch" {
  source   = "../../cloudwatch/modules/log-group"
  app_name = var.app_name
}
