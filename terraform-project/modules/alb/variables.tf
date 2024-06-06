variable "project_name" {
  description = "The name of the Project"
  type        = string
}

variable "alb_security_group_id" {
  description = "The applicatiom-load-balancer SG id"
  type        = string
}
 

variable "public_subnet_az1_id" {
  description = "The id for public subnet az1"
  type        = string
}

variable "public_subnet_az2_id" {
  description = "The id for public subnet az2"
  type        = string
}

variable "vpc_id" {
  description = "The vpc id"
  type        = string
}

variable "arn_certificate" {
  description = "The arn certificate"
  type        = string
}
