output "s3_static_website_dns" {
  description = "S3 bucket static website's DNS name"
  value = module.s3_static_website.s3_static_website_dns
}