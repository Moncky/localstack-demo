output "output" {
  value = "Hello, World!"
}

aws_s3_bucket "bucket" {
  bucket = var.bucket_name
}   
