resource "aws_identitystore_group" "this" {
  identity_store_id = var.identity_store_id
  display_name      = var.display_name
}

output "id" {
  value = aws_identitystore_group.this.group_id
}