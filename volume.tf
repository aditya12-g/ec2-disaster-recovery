resource "aws_ebs_volume" "target_volume" {
  provider         = aws.target
  availability_zone = data.aws_subnet.default_target_subnet.availability_zone
  snapshot_id      = aws_ebs_snapshot_copy.target_snapshot.id
  tags = {
    Name = "DR-Recovery-Volume"
  }
}
resource "aws_volume_attachment" "target_volume_attachment" {
  device_name = "/dev/xvdf"  # Attach as secondary volume
  volume_id   = aws_ebs_volume.target_volume.id
  instance_id = aws_instance.target_instance.id
  depends_on = [aws_instance.target_instance]
}