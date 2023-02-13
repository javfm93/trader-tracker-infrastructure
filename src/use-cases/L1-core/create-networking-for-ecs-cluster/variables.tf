variable "region" {
  type = string
}

variable "ecs_ami" {
  type = string
}

variable "instance_type" {
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

variable "private_alb_config" {
  type = object({
    ingress_rules = list(object({
      description     = string
      from_port       = number
      to_port         = number
      protocol        = string
      cidr_blocks     = list(string)
      security_groups = list(string)
    }))
  })
  description = "Private ALB configuration"
}

variable "public_alb_config" {
  type = object({
    ingress_rules = list(object({
      description     = string
      from_port       = number
      to_port         = number
      protocol        = string
      cidr_blocks     = list(string)
      security_groups = list(string)
    }))
  })
  description = "Public ALB configuration"
}