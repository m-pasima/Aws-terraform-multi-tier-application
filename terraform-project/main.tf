provider "aws" {
  region  = var.region
  profile = "default"
}

module "vpc" {
  source                        = "./modules/vpc"
  project_name                  = var.project_name
  region                        = var.region
  vpc_cidr                      = var.vpc_cidr
  public_subnet_az1_cidr        = var.public_subnet_az1_cidr
  public_subnet_az2_cidr        = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr   = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr   = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr  = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr  = var.private_data_subnet_az2_cidr
}

module "nat_gateway" {
  source                        = "./modules/nat_gateway"
  public_subnet_az1_id          = module.vpc.public_subnet_az1_id
  internet_gateway_id           = module.vpc.internet_gateway_id
  public_subnet_az2_id          = module.vpc.public_subnet_az2_id
  vpc_id                        = module.vpc.vpc_id
  private_app_subnet_az1_id     = module.vpc.private_app_subnet_az1_id
  private_data_subnet_az2_id    = module.vpc.private_data_subnet_az2_id
  private_app_subnet_az2_id     = module.vpc.private_app_subnet_az2_id
  private_data_subnet_az1_id    = module.vpc.private_data_subnet_az1_id
}

module "security-groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

module "ecs-task-execution-role" {
  source       = "./modules/ecs-task-execution-role"
  project_name = module.vpc.project_name
}

module "acm" {
  source            = "./modules/acm"
  domain_name       = var.domain_name
  alternative_name  = var.alternative_name
  
}

module "application_load_balancer" {
  source                 = "./modules/alb"
  project_name           = var.project_name
  alb_security_group_id  = module.security-groups.alb_security_group_id
  public_subnet_az1_id   = module.vpc.public_subnet_az1_id
  public_subnet_az2_id   = module.vpc.public_subnet_az2_id
  vpc_id                 = module.vpc.vpc_id
  arn_certificate        = module.acm.arn_certificate
}