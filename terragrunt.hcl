remote_state {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cscott-state-dm-sandbox"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terragrunt-locks"
    s3_bucket_tags = {
      name = "Terragrunt state storage"
    }
  }
}

inputs = merge(
  yamldecode(file(find_in_parent_folders("account.yaml"))),
  yamldecode(file(find_in_parent_folders("env.yaml", find_in_parent_folders("empty.yaml"))))
)

