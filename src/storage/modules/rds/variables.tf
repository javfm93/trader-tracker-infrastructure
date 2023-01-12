variable "app_name" {
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
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}