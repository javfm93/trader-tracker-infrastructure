variable "db_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "port" {
  type = string
}

variable "db_instance_class" {
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

variable "security_group_ids" {
  type = list(string)
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}