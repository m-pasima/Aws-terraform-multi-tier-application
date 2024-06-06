output "domain_name" {
    value = var.domain_name 
}

output "arn_certificate" {
  value = aws_acm_certificate.acm_certificate.arn
}
