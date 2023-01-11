variable "region" {
  type = string
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "app_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "app_port" {
  type = number
}

variable "subnets_id" {
  type = list(string)
}

variable "key_pair_name" {
  type = string
}

variable "iam_instance_profile_id" {
  type = string
}

variable "security_groups_id" {
  type = list(string)
}

variable "target_group_arns" {
  type = list(string)
}
