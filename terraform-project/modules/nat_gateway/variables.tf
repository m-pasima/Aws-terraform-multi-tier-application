variable "public_subnet_az1_id" {
  description = "ID of the public subnet in availability zone 1"
  type        = string
}

variable "public_subnet_az2_id" {
  description = "ID of the public subnet in availability zone 2"
  type        = string
}

variable "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "private_app_subnet_az1_id" {
  description = "ID of the private app subnet in availability zone 1"
  type        = string
}

variable "private_app_subnet_az2_id" {
  description = "ID of the private app subnet in availability zone 2"
  type        = string
}

variable "private_data_subnet_az1_id" {
  description = "ID of the private data subnet in availability zone 1"
  type        = string
}

variable "private_data_subnet_az2_id" {
  description = "ID of the private data subnet in availability zone 2"
  type        = string
}

