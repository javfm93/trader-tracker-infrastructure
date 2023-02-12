module "organization" {
  source = "../../modules/organization"
}

module "workload-unit" {
  source    = "../../modules/organizational-unit"
  parent_id = module.organization.id
}

module "production" {
  source    = "../../modules/organization-account"
  name      = "Production"
  email     = var.production_account_owner_email
  parent_id = module.workload-unit
}

module "allowed_regions_policy" {
  source               = "../../modules/organization-policy"
  policy_document_json = data.aws_iam_policy_document.restrict_regions.json
  target_id            = module.organization.id
}

module "allowed_ec2_policy" {
  source               = "../../modules/organization-policy"
  policy_document_json = data.aws_iam_policy_document.restrict_ec2_types.json
  target_id            = module.organization.id
}
