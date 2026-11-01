ami_id             = "ami-xxxxxxxx"
subnet_id          = "subnet-xxxxxxxx"
security_group_ids = ["sg-xxxxxxxx"]

instances = {
  web-server = {
    instance_type = "t3.micro"
    key_name      = "web-key"
    volume_type   = "gp3"
    volume_size   = 20
  }

  app-server = {
    instance_type = "t3.small"
    key_name      = "app-key"
    volume_type   = "gp2"
    volume_size   = 30
  }

  worker-server = {
    instance_type = "t3.medium"
    key_name      = "worker-key"
    volume_type   = "gp3"
    volume_size   = 40
  }

  database-server = {
    instance_type        = "m5.large"
    key_name             = "database-key"
    volume_type          = "io1"
    volume_size          = 100
    iops                 = 3000
    protect_from_destroy = true
  }

  batch-server = {
    instance_type = "c5.large"
    key_name      = "batch-key"
    volume_type   = "gp3"
    volume_size   = 80
  }
}
