

resource "aws_s3_bucket" "s3_ec2" {
  bucket = var.s3_bucket

  tags = var.s3_tags
}

resource "aws_s3_bucket_acl" "s3_ec2_acl" {
  bucket = var.s3_bucket
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_access" {
  bucket = var.s3_bucket

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
}

resource "aws_iam_role" "web_iam_role" {
    name = "web_iam_role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "s3_instance_profile" {
    name = "s3_instance_profile"
    role = aws_iam_role.web_iam_role.id
}

resource "aws_iam_role_policy" "s3_iam_role_policy" {
  name = "s3_iam_role_policy"
  role = aws_iam_role.web_iam_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject"
      ],
      "Resource": ["arn:aws:s3:::${var.s3_bucket}/*"]
    }
  ]
}
EOF
}