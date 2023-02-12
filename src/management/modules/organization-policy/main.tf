resource "aws_organizations_policy" "this" {
  name        = "restrict_regions"
  description = "Deny all regions except Ireland"
  content     = var.policy_document_json
}

resource "aws_organizations_policy_attachment" "this" {
  policy_id = aws_organizations_policy.this.id
  target_id = var.target_id
}
