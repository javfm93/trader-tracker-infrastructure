variable "app_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnets_id" {
  type = list(string)
}
