output "output" {
  value = "Hello, World!"
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}
