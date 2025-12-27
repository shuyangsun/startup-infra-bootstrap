locals {
  env_mapping = {
    for env, name in var.environments : env => {
      is_prod             = env == "prod" || env == "production"
      bucket              = "${var.company_id}-tfstate-${env}-${var.region}"
      bucket_name         = "${var.company_name} Terraform State Bucket for ${name}"
      kms_key_name        = "${var.company_id}-tfstate-key-${env}-${var.region}"
      kms_key_description = "Used to encrypt Terraform state objects for bucket \"${var.company_id}-tfstate-${env}-${var.region}\"."
    }
  }
}
