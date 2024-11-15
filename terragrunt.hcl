# remote_state {
#   backend = "s3"

#   config = {
#     encrypt        = true
#     bucket         = "cscott-state-dm-sandbox"
#     key            = "${path_relative_to_include()}/terraform.tfstate"
#     region         = "eu-west-1"
#     endpoint       = "http://s3.localhost.localstack.cloud:4566"
#     dynamodb_table = "terragrunt-locks"
#     s3_bucket_tags = {
#       name = "Terragrunt state storage"
#     }

#     # You might also need these for LocalStack
#     force_path_style = true
#     skip_credentials_validation = true
#     skip_metadata_api_check = true
#     skip_bucket_versioning = true
#   }
# }

remote_state {
  backend = "local"
  config = {
    path = "${get_parent_terragrunt_dir()}/${path_relative_to_include()}/terraform.tfstate"
  }

  generate = {
    path = "backend.tf"
    if_exists = "overwrite"
  }
}


inputs = merge(
  yamldecode(file(find_in_parent_folders("account.yaml"))),
  yamldecode(file(find_in_parent_folders("env.yaml", find_in_parent_folders("empty.yaml"))))
)
