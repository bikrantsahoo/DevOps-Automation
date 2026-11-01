locals {
  all_instances = merge(
    aws_instance.normal,
    aws_instance.protected
  )
}

output "instance_name_to_id" {
  value = {
    for name, instance in local.all_instances :
    name => instance.id
  }
}

output "instance_name_to_private_ip" {
  value = {
    for name, instance in local.all_instances :
    name => instance.private_ip
  }
}
