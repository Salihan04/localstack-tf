locals {
  root_dir = get_repo_root()
}

terraform {
  before_hook "prechecks" {
    commands = ["plan", "apply"]
    execute  = ["${local.root_dir}/scripts/prechecks.sh"]
  }

  source = "${local.root_dir}/modules//s3"
}

inputs = {
  bucket_name = "localstack-bucket"
}