resource "aws_alb" "this" {
  name               = var.private ? "${var.app_name}-private-alb" : "${var.app_name}-public-alb"
  internal           = var.private
  load_balancer_type = "application"
  subnets            = var.subnets
  security_groups    = var.security_groups
}

// What are the request that we are going to act on
resource "aws_alb_listener" "this" {
  load_balancer_arn = aws_alb.this.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "No routes defined"
      status_code  = "200"
    }
  }
}
