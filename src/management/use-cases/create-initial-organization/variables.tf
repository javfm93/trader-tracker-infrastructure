variable "production_account_owner_email" {
  type = string
}

variable "allowed_regions" {
  type = list(string)
}

variable "allowed_ec2_instance_types" {
  type = list(string)
}