data "aws_iam_policy_document" "access-to-parameter-store" {
  statement {
    actions   = ["ssm:GetParameters"]
    effect    = "Allow"
    resources = [for parameter in var.parameters : parameter.valueFrom]
  }
}

