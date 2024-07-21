
output "elastic_ip" {
  description = "URL to access application home page"
  value       = "http://${aws_eip.lb.public_ip}"
}

output "elastic_ip_app1" {
  description = "URL to access application's /var/www/html/app1 page"
  value       = "http://${aws_eip.lb.public_ip}/app1/"
}

output "elastic_ip_metadata" {
  description = "URL to access the application metadata"
  value       = "http://${aws_eip.lb.public_ip}/app1/metadata.html"
}