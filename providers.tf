terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.26.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.79.0"
    }
  }
}

provider "github" {
  token = var.gh_token
  owner = "milesjh"
}

provider "tfe" {
  hostname = var.hostname
  token    = var.tfe_token
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

provider "azurerm" {
  features {}
}