output "project_name" {
  value = var.project_name
}

output "ecs_tasks_execution_role_arn" {
  value = aws_iam_role.ecs_tasks_execution_role.arn
}



