resource "aws_ssoadmin_permission_set" "this" {
  name         = var.name
  instance_arn = var.identity_store_arn
}

resource "aws_ssoadmin_managed_policy_attachment" "this" {
  instance_arn       = var.identity_store_arn
  managed_policy_arn = var.managed_policy_arn
  permission_set_arn = aws_ssoadmin_permission_set.this
}

output "arn" {
  value = aws_ssoadmin_permission_set.this.arn
}