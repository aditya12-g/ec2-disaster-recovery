resource "aws_instance" "target_instance" {
  provider      = aws.target
  ami           = "ami-071226ecf16aa7d96" 
  instance_type = data.aws_instance.source_instance.instance_type
  key_name      = data.aws_instance.source_instance.key_name
  subnet_id     = data.aws_subnet.default_target_subnet.id  
  associate_public_ip_address = true 


  tags = {
    Name = "Disaster-Recovery-Instance"
  }
}
