module "task-execution-role" {
  source   = "../../modules/iam-task-execution-role"
  app_name = var.app_name
}

resource "aws_iam_role_policy" "this" {
  count  = length(var.parameters) > 0 ? 1 : 0
  policy = data.aws_iam_policy_document.access-to-parameter-store.json
  role   = module.task-execution-role.id
}

output "arn" {
  value = module.task-execution-role.arn
}
