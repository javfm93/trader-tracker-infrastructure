module "organization" {
  source                         = "../../management/use-cases/create-initial-organization"
  production_account_owner_email = var.production_account_owner_email
  allowed_ec2_instance_types     = [
    "t2.micro",
    "t3.micro",
    "t4g.micro"
  ]
  allowed_regions = ["eu-west-1"]
}

module "sso" {
  source                = "../../management/use-cases/create-initial-sso-setup"
  admin_email           = var.admin_email
  production_account_id = module.organization.prod_account_id
}