resource "aws_identitystore_user" "this" {
  identity_store_id = var.identity_store_id
  display_name      = var.display_name
  user_name         = var.user_name

  name {
    given_name  = var.name
    family_name = var.lastname
  }

  emails {
    value = var.user_email
  }
}

resource "aws_identitystore_group_membership" "this" {
  identity_store_id = var.identity_store_id
  group_id          = var.group_id
  member_id         = aws_identitystore_user.this.user_id
}