output "region" {
  value = var.region
}

output "project_name" {
  value = module.vpc.project_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_az1_id" {
  value = module.vpc.public_subnet_az1_id
}

output "public_subnet_az2_id" {
  value = module.vpc.public_subnet_az2_id
}

output "private_app_subnet_az1_id" {
  value = module.vpc.private_app_subnet_az1_id
}

output "private_app_subnet_az2_id" {
  value = module.vpc.private_app_subnet_az2_id
}

output "private_data_subnet_az1_id" {
  value = module.vpc.private_data_subnet_az1_id
}

output "private_data_subnet_az2_id" {
  value = module.vpc.private_data_subnet_az2_id
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "alb_security_group_id" {
  value = module.security-groups.alb_security_group_id
}
output "ecs_tasks_execution_role_arn" {
  value = module.ecs-task-execution-role.ecs_tasks_execution_role_arn
}


output "vpc_module_outputs" {
  value = module.vpc
}

output "alb_target_group_arn" {
  value = module.application_load_balancer.alb_target_group_arn
}

output "alb_dns_name" {
  value = module.application_load_balancer.alb_dns_name
}

output "alb_zone_id" {
  value = module.application_load_balancer.alb_zone_id
}


