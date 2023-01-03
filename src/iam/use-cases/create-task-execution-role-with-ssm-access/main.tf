module "task-execution-role" {
  source   = "../../modules/iam-task-execution-role"
  app_name = var.app_name
}

resource "aws_iam_role_policy" "this" {
  policy = data.aws_iam_policy_document.access-to-parameter-store.json
  role   = module.task-execution-role.id
}

output "arn" {
  value = module.task-execution-role.arn
}
