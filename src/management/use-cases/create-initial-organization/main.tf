module "organization" {
  source = "../../components/organization"
}

module "workload-unit" {
  source    = "../../components/organizational-unit"
  name      = "Workload"
  parent_id = module.organization.root_id
}

module "production" {
  source    = "../../components/organization-account"
  name      = "Production"
  email     = var.production_account_owner_email
  parent_id = module.workload-unit.id
}

module "allowed_regions_policy" {
  source               = "../../components/organization-policy"
  policy_document_json = data.aws_iam_policy_document.restrict_regions.json
  target_id            = module.workload-unit.id
  name                 = "Allowed Regions"
  depends_on           = [module.workload-unit]
}

module "allowed_ec2_policy" {
  source               = "../../components/organization-policy"
  policy_document_json = data.aws_iam_policy_document.restrict_ec2_types.json
  target_id            = module.workload-unit.id
  name                 = "Allowed ec2 instances"
  depends_on           = [module.workload-unit]
}
