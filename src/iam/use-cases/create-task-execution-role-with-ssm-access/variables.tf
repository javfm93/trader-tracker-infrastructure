variable "parameters" {
  type = list(object({ name = string, valueFrom = string }))
}

variable "app_name" {
  type = string
}