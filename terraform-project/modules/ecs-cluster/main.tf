# create ecs cluster
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.project_name}-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}

# create cloudwatch log group
resource "aws_cloudwatch_log_group" "log_group" {
  name = "${var.project_name}-task-definition"

  lifecycle {
    create_before_destroy = true
  }
}

# create task definition
resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "${var.project_name}-task-definition"
  execution_role_arn       = var.execution_role_arn
  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  cpu                      = var.cpu
  memory                   = var.memory

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  container_definitions = jsonencode([
    {
      name      = "${var.project_name}-container"
      image     = var.container_image
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
        }
      ]
      
      ulimits = [
        {
          name      = "nofile"
          softLimit = 1024000
          hardLimit = 1024000
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.log_group.name
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "${var.project_name}"
        }
      }
    }
  ])
}

# create ecs service
resource "aws_ecs_service" "ecs_service" {
  name                             = "${var.project_name}-service"
  launch_type                      = var.launch_type
  cluster                          = aws_ecs_cluster.ecs_cluster.id
  task_definition                  = aws_ecs_task_definition.ecs_task_definition.arn
  platform_version                 = var.platform_version
  desired_count                    = var.desired_count
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  deployment_maximum_percent       = var.deployment_maximum_percent

  # task tagging configuration
  enable_ecs_managed_tags = var.enable_ecs_managed_tags
  propagate_tags          = var.propagate_tags

  # vpc and security groups
  network_configuration {
    subnets          = var.subnets
    security_groups  = var.security_groups
    assign_public_ip = var.assign_public_ip
  }

  # load balancing
  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "${var.project_name}-container"
    container_port   = var.container_port
  }
}
