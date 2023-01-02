variable "region" {
  type = string
}

variable "ecs-ami" {
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

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_public_subnets" {
  type = list(object({
    cidr              = string
    availability_zone = string
  }))
}

variable "vpc_private_subnets" {
  type = list(object({
    cidr              = string
    availability_zone = string
  }))
}

variable "cidr_blocks" {
  type = map(string)
}

variable "parameters" {
  type = list(object({ name = string, valueFrom = string }))
}
