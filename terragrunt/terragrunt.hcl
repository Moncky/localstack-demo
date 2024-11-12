terraform {
  source = "../module"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  bucket_name = "test-bucket"
}
