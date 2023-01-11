// how to act on a specific case redirecting to a target group
resource "aws_alb_listener_rule" "alb_listener_rule" {
  listener_arn = var.alb_listener_arn
  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.this.arn
  }
  condition {
    path_pattern {
      values = var.target_group.path_pattern
    }
  }
}

// The configuration to hit a concrete service
resource "aws_alb_target_group" "this" {
  name     = "${var.app_name}-target-group"
  port     = var.target_group.port
  protocol = var.target_group.protocol
  vpc_id   = var.vpc_id

  health_check {
    path     = var.target_group.health_check_path
    protocol = var.target_group.protocol
  }
}

output "target_group_arn" {
  value = aws_alb_target_group.this.arn
}