data "aws_ssoadmin_instances" "this" {}

locals {
  identity_store = {
    id  = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
    arn = tolist(data.aws_ssoadmin_instances.this.arns)[0]
  }
  admin_policy = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_caller_identity" "current" {}
