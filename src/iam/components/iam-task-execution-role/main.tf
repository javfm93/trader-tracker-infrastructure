resource "aws_iam_role" "this" {
  name               = "ECS-${var.app_name}-task-execution-role"
  assume_role_policy = data.aws_iam_policy_document.assume-ecs-tasks.json
}

resource "aws_iam_role_policy_attachment" "ec2-container-management-to-ecs-role" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
output "id" {
  value = aws_iam_role.this.id
}

output "arn" {
  value = aws_iam_role.this.arn
}
