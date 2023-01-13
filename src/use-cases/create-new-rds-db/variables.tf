variable "app_name" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_port" {
  type = string
}

variable "db_instance_class" {
  type = string
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