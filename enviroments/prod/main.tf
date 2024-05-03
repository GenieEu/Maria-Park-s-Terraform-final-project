provider "aws" {
  region = "us-east-1"
}

module "s3_static_website" {
  source = "../../modules/s3_static_website"
  bucket_name = "maria-terraform-final-project"
}