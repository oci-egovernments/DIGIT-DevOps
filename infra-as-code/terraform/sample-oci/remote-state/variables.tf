variable "region" {
  type        = string
  description = "The OCI region key"
}

variable "s3_endpoint" {
  type        = string
  description = "The S3 compatible API endpoint"
  default     = "https://apaccpt03.compat.objectstorage.eu-frankfurt-1.oraclecloud.com"
}

variable "s3_access_key" {
  type        = string
  description = "Access Key for S3 compatible API"
}

variable "s3_secret_key" {
  type        = string
  description = "Secret Key for S3 compatible API"
}

variable "tf_state_bucket_name" {
  type        = string
  description = "Name of the bucket to be used for storing the terraform remote state"
  default     = "digit-sandbox-terraform-states"
}

variable "tf_state_object_key" {
  type        = string
  description = "Name of the bucket to be used for storing the terraform remote state"
  default     = "digit-sandbox-tf.tfstate"
}



