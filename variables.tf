variable "token" {
  description = "TFE User Token"
}

variable "aws_region" {
  description = "region to deploy resources in"
  default     = "us-east-2"
}

variable "use_case_name" {}

variable "org" {}

variable "hostname" {}

variable "vcs_identifier" {}

variable "oauth_token" {}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "creator_workspace" {}
variable "gh_token" {}
variable "tfe_token" {}
variable "arm_client_id" {}
variable "arm_client_secret" {}
variable "arm_tenant_id" {}
variable "arm_subscription_id" {}