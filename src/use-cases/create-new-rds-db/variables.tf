variable "app_name" {
  type = string
}

variable "db" {
  type = object({
    name           = string
    port           = number
    subnet_ids     = list(string)
    instance_class = string
  })
}

variable "vpc_id" {
  type = string
}

variable "storage" {
  type = string
}

variable "engine" {
  type = object({
    name    = string
    version = string
  })
}

variable "allowed_security_group_ids" {
  type = list(string)
}