output "target_instance_id" {
  description = "ID of the new EC2 instance in the target region"
  value       = aws_instance.target_instance.id
}

output "target_instance_public_ip" {
  description = "Public IP of the recovered EC2 instance"
  value       = aws_instance.target_instance.public_ip
}
