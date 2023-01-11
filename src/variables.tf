variable "region" {
  default = "eu-west-1"
}

variable "ecs-ami" {
  default = "ami-00ce328eb1ed0570d" #amd ami
}

variable "instance_type" {
  default = "t2.micro"
}

variable "cluster_name" {
  default = "trader-tracker"
}

variable "app_port" {
  default = 5000
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16" # 10.0.0.0/16 --> 10.0.X.X, 0 < x < 255 (vpc)
}

variable "vpc_public_subnets" {
  type = list(object({
    cidr              = string
    availability_zone = string
  }))

  default = [
    {
      cidr              = "10.0.1.0/24" # 10.0.1.0/24 --> 10.0.0.X (subnet)
      availability_zone = "a"
    },
    {
      cidr              = "10.0.2.0/24"
      availability_zone = "b"
    }
  ]
}


variable "vpc_private_subnets" {
  type = list(object({
    cidr              = string
    availability_zone = string
  }))

  default = [
    {
      cidr              = "10.0.4.0/24"
      availability_zone = "a"
    },
    {
      cidr              = "10.0.5.0/24"
      availability_zone = "b"
    }
  ]
}

variable "cidr_blocks" {
  type = map(string)
  default = {
    all_ip_addresses = "0.0.0.0/0"
  }
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
  default = {
    ingress_rules = [
      {
        description     = "Enable communication with internal ports"
        from_port       = 80
        to_port         = 5000
        protocol        = "tcp"
        cidr_blocks     = ["10.0.0.0/16"]
        security_groups = null
      }
    ]
  }
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
  default = {
    ingress_rules = [
      {
        description     = "Enable communication on default port"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        security_groups = null
      }
    ]
  }
}