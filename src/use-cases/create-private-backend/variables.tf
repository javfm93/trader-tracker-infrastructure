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

variable "ami" {
  default = "ami-00ce328eb1ed0570d" #ecs amd ami
}

variable "instance_type" {
  default = "t2.micro" # free tier
}

variable "public_key_path" {
  type = string
}

variable "private_alb" {
  type = object({
    listener_arn      = string
    security_group_id = string
  })
}

variable "app_target_group" {
  type = object({
    port              = number
    protocol          = string
    path_pattern      = list(string)
    health_check_path = string
    priority          = number
  })

}

variable "private_subnets_id" {
  type = list(string)
}