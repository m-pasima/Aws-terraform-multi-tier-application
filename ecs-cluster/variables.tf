variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "execution_role_arn" {
  description = "The ARN of the ECS task execution role"
  type        = string
}

variable "network_mode" {
  description = "The Docker networking mode to use for the containers in the task"
  type        = string
}

variable "requires_compatibilities" {
  description = "A set of launch types required by the task"
  type        = list(string)
}

variable "cpu" {
  description = "The number of CPU units used by the task"
  type        = string
}

variable "memory" {
  description = "The amount of memory (in MiB) used by the task"
  type        = string
}

variable "container_image" {
  description = "The Docker image to use for the container"
  type        = string
}

variable "container_port" {
  description = "The port number on the container that is bound to the user-specified or automatically assigned host port"
  type        = number
}

variable "region" {
  description = "The AWS region"
  type        = string
}

variable "launch_type" {
  description = "The launch type on which to run your service"
  type        = string
}

variable "platform_version" {
  description = "The platform version on which to run your service"
  type        = string
}

variable "desired_count" {
  description = "The number of instances of the specified task definition to place and keep running"
  type        = number
}

variable "deployment_minimum_healthy_percent" {
  description = "The minimum healthy percent to use for the service's deployment"
  type        = number
}

variable "deployment_maximum_percent" {
  description = "The maximum percent to use for the service's deployment"
  type        = number
}

variable "enable_ecs_managed_tags" {
  description = "Specifies whether to enable Amazon ECS managed tags for the tasks within the service"
  type        = bool
}

variable "propagate_tags" {
  description = "Specifies whether to propagate the tags from the task definition or the service to the tasks"
  type        = string
}

variable "subnets" {
  description = "The subnets associated with the task or service"
  type        = list(string)
}

variable "security_groups" {
  description = "The security groups associated with the task or service"
  type        = list(string)
}

variable "assign_public_ip" {
  description = "Specifies whether the task's elastic network interface receives a public IP address"
  type        = bool
}

variable "target_group_arn" {
  description = "The ARN of the target group to associate with the service"
  type        = string
}
