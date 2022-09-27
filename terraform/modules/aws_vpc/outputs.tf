output "public_subnets" {
  description = "IDs of the VPC's public subnets"
  value       = module.vpc.public_subnets
}

output "default_security_group_id" {
  description = "IDs of the VPC's default security group id"
  value       = module.vpc.default_security_group_id
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_cidr_block
}