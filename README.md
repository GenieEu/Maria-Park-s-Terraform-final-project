# Terraform AWS S3 Bucket Setup

This Terraform configuration sets up an AWS S3 bucket along with necessary configurations for hosting a static website.

## HTML files

- `index.html`

- `error.html`

## Variables

- `Bucket Name`: Bucket name. Has to be unique.

- `Tag`: Owner/project name tag for resources.

## Resources

### AWS S3 Bucket

- `bucket`: Name of the S3 bucket.
- `force_destroy`: Whether all objects should be deleted from the bucket so that the bucket can be destroyed when removed from the Terraform configuration.
- `tags`: Tags to be applied to the bucket.

### AWS S3 Bucket Versioning

- `bucket`: The ID of the S3 bucket.
- `versioning_configuration`: Configuration for enabling versioning on the bucket.

### AWS S3 Bucket Website Configuration

- `bucket`: The ID of the S3 bucket.
- `index_document`: Configuration for the index document of the static website.
- `error_document`: Configuration for the error document of the static website.

### AWS S3 Bucket Public Access Block

- `bucket`: The ID of the S3 bucket.
- `block_public_acls`: Whether to block public ACLs on the bucket.
- `block_public_policy`: Whether to block public policy on the bucket.
- `ignore_public_acls`: Whether to ignore public ACLs on the bucket.
- `restrict_public_buckets`: Whether to restrict public buckets on the bucket.

### AWS S3 Bucket Policy

- `bucket`: The ID of the S3 bucket.
- `policy`: JSON-encoded policy for allowing public read access to objects in the bucket.

### AWS S3 Object

- `bucket`: The ID of the S3 bucket.
- `for_each`: Configuration for uploading HTML files to the bucket.
- `key`: The key of the object in the bucket.
- `source`: The path to the HTML file to upload.
- `etag`: The MD5 hash of the object.
- `content_type`: The content type of the object.

# Outputs

- `S3 Static Website DNS`: S3 bucket static website's DNS name.
