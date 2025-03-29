
data "aws_instance" "source_instance" {
  provider    = aws.source
  instance_id = var.source_instance_id  
}


data "aws_ebs_volume" "source_volume" {
  provider = aws.source
  filter {
    name   = "attachment.instance-id"
    values = [data.aws_instance.source_instance.id]
  }
}

# Fetch the default VPC in the target region
data "aws_vpc" "default_target_vpc" {
  provider = aws.target
  default  = true
}

# Fetch the default subnet in us-east-1a
data "aws_subnet" "default_target_subnet" {
  provider = aws.target

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_target_vpc.id]  # Ensure it belongs to the correct VPC
  }

  filter {
    name   = "availability-zone"
    values = ["us-east-1c"]  # Change this if needed
  }
  
}




