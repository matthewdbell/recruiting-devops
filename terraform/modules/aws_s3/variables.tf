variable "s3_bucket" {
  description = "Name of s3 bucket"
  type        = string
  default     = "stage-shootproof-s3-bucket"
}

variable "s3_tags" {
  description = "Tags to apply to resources created by s3 module"
  type        = map(string)
  default = {
    Division = "shootproof"
    Environment = "stage"
  }
}