variable "app_name" {
  type = string
}

variable "private" {
  type = bool
}

variable "subnets" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

