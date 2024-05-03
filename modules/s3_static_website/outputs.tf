output "s3_static_website_dns" {
  description = "S3 bucket static website's DNS name"
  value = aws_s3_bucket_website_configuration.static_website.website_endpoint
}