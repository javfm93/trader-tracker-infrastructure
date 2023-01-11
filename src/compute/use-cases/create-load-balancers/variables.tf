variable "app_name" {
  type = string
}

variable "app_port" {
  type = number
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
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
