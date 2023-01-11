variable "app_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "target_group" {
  type = object({
    port              = number
    protocol          = string
    path_pattern      = list(string)
    health_check_path = string
    priority          = number
  })
}

variable "alb_listener_arn" {
  type = string
}