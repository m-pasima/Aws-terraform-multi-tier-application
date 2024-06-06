variable "region" {
  description = "AWS region"
  type        = string
}


variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_az1_cidr" {
  description = "CIDR block for the public subnet in availability zone 1"
  type        = string
}

variable "public_subnet_az2_cidr" {
  description = "CIDR block for the public subnet in availability zone 2"
  type        = string
}

variable "private_app_subnet_az1_cidr" {
  description = "CIDR block for the private app subnet in availability zone 1"
  type        = string
}

variable "private_app_subnet_az2_cidr" {
  description = "CIDR block for the private app subnet in availability zone 2"
  type        = string
}

variable "private_data_subnet_az1_cidr" {
  description = "CIDR block for the private data subnet in availability zone 1"
  type        = string
}

variable "private_data_subnet_az2_cidr" {
  description = "CIDR block for the private data subnet in availability zone 2"
  type        = string
}

variable "domain_name" {
   description = "The name of the domain"
   type        = string
}


variable "alternative_name" {
   description = "The alternative name of the domain"
   type        = string
}

