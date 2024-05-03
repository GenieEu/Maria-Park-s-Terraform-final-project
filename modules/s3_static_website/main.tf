resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  force_destroy = true
  tags = {
    Owner        = var.tag
    Environment = "${terraform.workspace}"
  }
}

resource "aws_s3_bucket_versioning" "versioning_enable" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "PublicReadGetObject",
          "Effect" : "Allow",
          "Principal" : "*",
          "Action" : "s3:GetObject",
          "Resource" : "arn:aws:s3:::${aws_s3_bucket.bucket.id}/*"
        }
      ]
    }
  )
}

resource "aws_s3_object" "upload_html_files" {
  bucket        = aws_s3_bucket.bucket.id
  for_each      = fileset("${path.module}/html/", "*") 
  key           = each.value
  source        = "${path.module}/html/${each.value}"
  etag          = filemd5("${path.module}/html/${each.value}")
  content_type  = each.key
}