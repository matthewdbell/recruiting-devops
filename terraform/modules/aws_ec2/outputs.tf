
output "ec2_instance_public_ip" {
  description = "Public IP address of EC2 instance"
  value       = module.ec2_instance.public_ip
}