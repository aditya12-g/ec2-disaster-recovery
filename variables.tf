variable "source_instance_id" {
  description = "ID of the source EC2 instance"
  type        = string
}

variable "source_region" {
  description = "AWS region of the source instance"
  type        = string
  default     = "ap-south-1"
}

variable "target_region" {
  description = "AWS region for the DR instance"
  type        = string
  default     = "us-east-1"
}
