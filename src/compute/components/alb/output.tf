output "id" {
  value = aws_alb.this.id
}

output "name" {
  value = aws_alb.this.name
}

output "dns" {
  value = aws_alb.this.dns_name
}

output "listener_arn" {
  value = aws_alb_listener.this.arn
}