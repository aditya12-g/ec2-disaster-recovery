# Create a snapshot of the root volume in the source region
resource "aws_ebs_snapshot" "source_snapshot" {
  provider  = aws.source
  volume_id = data.aws_ebs_volume.source_volume.id
  tags = {
    Name = "DR-Snapshot"
  }
}

# Copy the snapshot to the target region
resource "aws_ebs_snapshot_copy" "target_snapshot" {
  provider          = aws.target
  source_snapshot_id = aws_ebs_snapshot.source_snapshot.id
  source_region     = var.source_region
  tags = {
    Name = "Copied-DR-Snapshot"
  }
}
