variable "ec2_name" {
  description = "Name of ec2"
  type        = string
  default     = "stage_shootproof_ec2"
}

variable "ec2_ami" {
  description = "eu-central-1 - Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type"
  type        = string
  default     = "ami-05ff5eaef6149df49" 
}

variable "ec2_instance_type" {
  description = "Name of instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_tags" {
  description = "Tags to apply to resources created by ec2 module"
  type        = map(string)
  default = {
    Division = "shootproof"
    Environment = "stage"
  }
}

variable "ec2_subnet_id" {
  description = "Name of subnet_id"
}

variable "ec2_default_security_group_id" {
  description = "ID of the VPC's default security group id"
}

variable "ec2_vpc_id" {
  description = "Name of vpc_id"
}

variable "ec2_vpc_cidr" {
  description = "Name of vpc cidr block"
}

variable "ec2_instance_profile" {
  description = "ID of the instance profile"
}