variable "aws_region" {
  type        = string
  description = "The target AWS geographic deployment region."
  default     = "us-east-1"
}

variable "ubuntu_ami_id" {
  type        = string
  description = "The verified canonical Ubuntu Minimal LTS HVM AMI ID."
  default     = "ami-0c7217cdde317cfec" # Standard Ubuntu 22.04 LTS in us-east-1
}

variable "project_suffix" {
  type        = string
  description = "Unique alphanumeric string to bypass global collision limits in S3 namespaces."
  default     = "prod-99431"
}
