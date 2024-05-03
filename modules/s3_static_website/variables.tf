variable "bucket_name" {
  description = "Bucket name. Has to be unique"
  type = string
  default = ""
}

variable "tag" {
  description = "Owner/project name tag for resources"  
  type = string
  default = ""
}