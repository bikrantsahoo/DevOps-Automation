variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "role_b_arn" {
  type    = string
  default = "arn:aws:iam::000000000000:role/roleB"
}

variable "bucket_name" {
  type    = string
  default = "bikrant-cross-account-bucket-2026"
}
