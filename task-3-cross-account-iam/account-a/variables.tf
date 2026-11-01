variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "account_a_id" {
  type    = string
  default = "000000000000"
}

variable "account_b_id" {
  type    = string
  default = "111111111111"
}

variable "role_c_name" {
  type    = string
  default = "roleC"
}
