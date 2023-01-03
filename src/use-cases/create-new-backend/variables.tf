variable "region" {
  type = string
}

variable "app_name" {
  type = string
}

variable "cluster_id" {
  type = string
}

variable "app_port" {
  type = number
}

variable "ssm_parameters" {
  description = "List of ssm parameters to inject as env vars"
  type        = list(object({ name = string, valueFrom = string }))
}

variable "vpc_id" {
  type = string
}

variable "desired_tasks" {
  type = number
}

variable "elb_name" {
  type = string
}