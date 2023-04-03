resource "aws_s3_bucket_lifecycle_configuration" "bucket_config" {
  bucket = var.s3_bucket_module
   rule {
    id = "move_to_ia_or_glacier"
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 60
      storage_class = "GLACIER"
    }
    status = "Enabled"
  }
}
  