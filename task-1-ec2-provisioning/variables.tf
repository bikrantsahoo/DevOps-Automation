variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "ami_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "environment" {
  type    = string
  default = "Dev"
}

variable "owner" {
  type    = string
  default = "DevOps"
}

variable "instances" {
  description = "Configuration for five EC2 instances"

  type = map(object({
    instance_type        = string
    key_name             = string
    volume_type          = string
    volume_size          = number
    iops                 = optional(number)
    protect_from_destroy = optional(bool, false)
  }))

  validation {
    condition     = length(var.instances) == 5
    error_message = "Exactly five instances are required."
  }

  validation {
    condition = anytrue([
      for instance in values(var.instances) :
      contains(["io1", "io2"], instance.volume_type)
    ])
    error_message = "At least one instance must use io1 or io2."
  }
}
