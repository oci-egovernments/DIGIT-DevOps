# Terraform 1.5.7
terraform {
  backend "s3" {
    bucket                      = var.tf_state_bucket_name
    region                      = var.region
    key                         = var.tf_state_object_key
    skip_region_validation      = true
    skip_credentials_validation = true
    force_path_style            = true
    access_key                  = var.s3_access_key
    secret_key                  = var.s3_secret_key    
    skip_metadata_api_check     = true
    endpoint                    = var.s3_endpoint
  }
}