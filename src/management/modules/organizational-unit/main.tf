resource "aws_organizations_organizational_unit" "this" {
  name      = "security"
  parent_id = var.parent_id
}

output "id" {
  value = aws_organizations_organizational_unit.this.id
}