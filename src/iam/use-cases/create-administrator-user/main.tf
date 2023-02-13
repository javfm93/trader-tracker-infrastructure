module "iam-user" {
  source    = "../../components/iam-user"
  user_name = "Administrator"
}

module "iam-group-with-policy" {
  source           = "../../components/iam-group-with-policy"
  group_name       = "Administrators"
  group_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  group_users      = [module.iam-user.user_name]
}
