module "administrators-group" {
  source            = "../../components/sso-group"
  display_name      = "Administrators"
  identity_store_id = local.identity_store.id
}

module "administrator-user" {
  source            = "../../components/sso-user"
  display_name      = "Admin"
  group_id          = module.administrators-group.id
  identity_store_id = local.identity_store.id
  user_email        = var.admin_email
  user_name         = "Admin"
  lastname          = "Admin"
  name              = "Powerful"
}

module "administrator-permission-set" {
  source             = "../../components/sso-permission-set"
  identity_store_arn = local.identity_store.arn
  managed_policy_arn = local.admin_policy
  name               = "AdministratorAccess"
}

resource "aws_ssoadmin_account_assignment" "this" {
  instance_arn       = local.identity_store.arn
  permission_set_arn = module.administrator-permission-set.arn
  principal_id       = module.administrators-group.id
  principal_type     = "GROUP"
  target_id          = var.production_account_id
  target_type        = "AWS_ACCOUNT"
}

