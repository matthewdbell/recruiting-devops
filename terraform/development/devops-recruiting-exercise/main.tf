provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      name = "devops-recruiting-exercise"
    }
  }
}

# ------ STAGE -------
module "stage_vpc" {
  source = "../../modules/aws_vpc"
}

module "stage_s3" {
  source = "../../modules/aws_s3"
}

module "stage_ec2" {
  source = "../../modules/aws_ec2"
  ec2_default_security_group_id = ["${module.stage_vpc.default_security_group_id}"]
  ec2_subnet_id                 = "${module.stage_vpc.public_subnets[0]}"
  ec2_vpc_id                    = "${module.stage_vpc.vpc_id}"
  ec2_vpc_cidr                  = "${module.stage_vpc.vpc_cidr_block}"
  ec2_instance_profile          = "${module.stage_s3.s3_instance_profile}"
}


/*
# ------ TEST -------
module "test_vpc" {
  source = "../../modules/aws_vpc"
  vpc_name = "test_shootproof_vpc"
  vpc_tags = {
    Division = "shootproof"
    Environment = "test"
  }
}

module "test_s3" {
  source = "../../modules/aws_s3"
  s3_bucket = "test_shootproof_s3_bucket"
  s3_tags = {
    Division = "shootproof"
    Environment = "test"
  }

}

module "test_ec2" {
  source = "../../modules/aws_ec2"
  ec2_name = "test_shootproof_ec2"
  ec2_tags = {
    Division = "shootproof"
    Environment = "test"
  }

  ec2_default_security_group_id = ["${module.test_vpc.default_security_group_id}"]
  ec2_subnet_id                 = "${module.test_vpc.public_subnets[0]}"
  ec2_vpc_id                    = "${module.test_vpc.vpc_id}"
  ec2_vpc_cidr                  = "${module.test_vpc.vpc_cidr_block}"
  ec2_instance_profile          = "${module.test_s3.s3_instance_profile}"
}



# ------ PRODUCTION -------
module "production_vpc" {
  source = "../../modules/aws_vpc"
  vpc_name = "production_shootproof_vpc"
  vpc_tags = {
    Division = "shootproof"
    Environment = "production"
  }
}

module "production_s3" {
  source = "../../modules/aws_s3"
  s3_bucket = "production_shootproof_s3_bucket"
  s3_tags = {
    Division = "shootproof"
    Environment = "production"
  }
}

module "production_ec2" {
  source = "../../modules/aws_ec2"
  ec2_name = "production_shootproof_ec2"
  ec2_tags = {
    Division = "shootproof"
    Environment = "production"
  }

  ec2_default_security_group_id = ["${module.production_vpc.default_security_group_id}"]
  ec2_subnet_id                 = "${module.production_vpc.public_subnets[0]}"
  ec2_vpc_id                    = "${module.production_vpc.vpc_id}"
  ec2_vpc_cidr                  = "${module.production_vpc.vpc_cidr_block}"
  ec2_instance_profile          = "${module.production_s3.s3_instance_profile}"
}

*/