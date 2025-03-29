provider "aws" {
  alias  = "source"
  region = "ap-south-1"  # Change as per your source region
}

provider "aws" {
  alias  = "target"
  region = "us-east-1"  # Change as per your target region
}
