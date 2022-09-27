
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.5.0"

  name = var.ec2_name

  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = var.ec2_default_security_group_id
  subnet_id              = var.ec2_subnet_id

  tags = var.ec2_tags
  
  iam_instance_profile = var.ec2_instance_profile
}

module "ec2_security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.ec2_name}_security_group"
  vpc_id      = var.ec2_vpc_id 

  ingress_cidr_blocks      = [var.ec2_vpc_cidr]
  ingress_rules            = ["https-443-tcp", "http-80-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "1.1.1.1/32"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "8.8.8.8/32"
    },
  ]
} 