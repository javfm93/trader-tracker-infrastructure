resource "aws_ecs_cluster" "this" {
  name = "${var.cluster_name}-ecs-cluster"
}

output "id" {
  value = aws_ecs_cluster.this.id
}

output "name" {
  value = aws_ecs_cluster.this.name
}
