resource "tfe_organization_membership" "developers" {
  organization = var.org
  email        = "harrison.milesj+developer@gmail.com"
}

resource "tfe_team_organization_member" "developer" {
  team_id                    = tfe_team.developers.id
  organization_membership_id = tfe_organization_membership.developers.id
}

resource "tfe_team" "developers" {
  name         = "${var.use_case_name}-developers"
  organization = var.org
}

resource "tfe_organization_membership" "ops" {
  organization = var.org
  email        = "harrison.milesj+operator@gmail.com"
}

resource "tfe_team_organization_member" "operator" {
  team_id                    = tfe_team.ops.id
  organization_membership_id = tfe_organization_membership.ops.id
}

resource "tfe_team" "ops" {
  name         = "${var.use_case_name}-ops"
  organization = var.org
}

resource "tfe_registry_module" "terraform-tfe-workspace" {
  vcs_repo {
    display_identifier = "milesjh/terraform-tfe-workspace"
    identifier         = "milesjh/terraform-tfe-workspace"
    oauth_token_id     = var.oauth_token
  }
}

resource "tfe_policy_set" "sentinel-demo" {
  name         = "sentinel-demo"
  description  = "A brand new policy set"
  organization = "mjh-demo"
  global       = true

  vcs_repo {
    identifier         = "milesjh/sentinel-demo"
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = var.oauth_token
  }
}

# module "corp_it_dev_workspace" {
#   source = "./modules/workspace"

#   use_case_name = "corp_it"
#   org = var.org 
#   vcs_identifier = var.vcs_identifier
#   oauth_token = var.oauth_token
#   aws_access_key = var.aws_access_key
#   aws_secret_key = var.aws_secret_key
#   arm_client_id = var.arm_client_id
#   arm_client_secret = var.arm_client_secret
#   arm_tenant_id = var.arm_tenant_id
#   arm_subscription_id = var.arm_subscription_id
#   creator_workspace = var.creator_workspace
#   tfe_team_developers_id = tfe_team.developers.id
#   tfe_team_ops_id = tfe_team.ops.id
#   environment = "dev"
# }

# module "research_dev_workspace" {
#   source = "./modules/workspace"

#   use_case_name = "research"
#   org = var.org 
#   vcs_identifier = var.vcs_identifier
#   oauth_token = var.oauth_token
#   aws_access_key = var.aws_access_key
#   aws_secret_key = var.aws_secret_key
#   arm_client_id = var.arm_client_id
#   arm_client_secret = var.arm_client_secret
#   arm_tenant_id = var.arm_tenant_id
#   arm_subscription_id = var.arm_subscription_id
#   creator_workspace = var.creator_workspace
#   tfe_team_developers_id = tfe_team.developers.id
#   tfe_team_ops_id = tfe_team.ops.id
#   environment = "dev"
# }

# module "finance_dev_workspace" {
#   source = "./modules/workspace"

#   use_case_name = "finance"
#   org = var.org 
#   vcs_identifier = var.vcs_identifier
#   oauth_token = var.oauth_token
#   aws_access_key = var.aws_access_key
#   aws_secret_key = var.aws_secret_key
#   arm_client_id = var.arm_client_id
#   arm_client_secret = var.arm_client_secret
#   arm_tenant_id = var.arm_tenant_id
#   arm_subscription_id = var.arm_subscription_id
#   creator_workspace = var.creator_workspace
#   tfe_team_developers_id = tfe_team.developers.id
#   tfe_team_ops_id = tfe_team.ops.id
#   environment = "dev"
# }

# module "mfg_dev_workspace" {
#   source = "./modules/workspace"

#   use_case_name = "manufacturing"
#   org = var.org 
#   vcs_identifier = var.vcs_identifier
#   oauth_token = var.oauth_token
#   aws_access_key = var.aws_access_key
#   aws_secret_key = var.aws_secret_key
#   arm_client_id = var.arm_client_id
#   arm_client_secret = var.arm_client_secret
#   arm_tenant_id = var.arm_tenant_id
#   arm_subscription_id = var.arm_subscription_id
#   creator_workspace = var.creator_workspace
#   tfe_team_developers_id = tfe_team.developers.id
#   tfe_team_ops_id = tfe_team.ops.id
#   environment = "dev"
# }




# resource "tfe_team_access" "development-dev" {
#   access       = "admin"
#   team_id      = "${tfe_team.developers.id}"
#   workspace_id = "${tfe_workspace.development.id}"
# }

# resource "tfe_team_access" "staging-dev" {
#   access       = "write"
#   team_id      = "${tfe_team.developers.id}"
#   workspace_id = "${tfe_workspace.staging.id}"
# }

# resource "tfe_team_access" "production-dev" {
#   access       = "read"
#   team_id      = "${tfe_team.developers.id}"
#   workspace_id = "${tfe_workspace.production.id}"
# }

# resource "tfe_team_access" "production-ops" {
#   access       = "admin"
#   team_id      = "${tfe_team.ops.id}"
#   workspace_id = "${tfe_workspace.production.id}"
# }

# resource "tfe_team_access" "staging-ops" {
#   access       = "admin"
#   team_id      = "${tfe_team.ops.id}"
#   workspace_id = "${tfe_workspace.staging.id}"
# }

# resource "tfe_team_access" "development-ops" {
#   access       = "admin"
#   team_id      = "${tfe_team.ops.id}"
#   workspace_id = "${tfe_workspace.development.id}"
# }

# resource "tfe_workspace" "development" {
#   name         = "${var.use_case_name}-development"
#   organization = "${var.org}"
#   auto_apply   = true
#   queue_all_runs = false
#   terraform_version = "0.12.28"

#   vcs_repo {
#     branch         = "development"
#     identifier     = "${var.vcs_identifier}"
#     oauth_token_id = "${var.oauth_token}"
#   }
# }

# resource "tfe_workspace" "staging" {
#   name         = "${var.use_case_name}-staging"
#   organization = "${var.org}"
#   auto_apply   = true
#   terraform_version = "0.12.28"

#   vcs_repo {
#     branch         = "staging"
#     identifier     = "${var.vcs_identifier}"
#     oauth_token_id = "${var.oauth_token}"
#   }
# }

# resource "tfe_workspace" "production" {
#   name         = "${var.use_case_name}-production"
#   organization = "${var.org}"
#   terraform_version = "0.12.28"

#   vcs_repo {
#     branch         = "master"
#     identifier     = "${var.vcs_identifier}"
#     oauth_token_id = "${var.oauth_token}"
#   }
# }

# resource "tfe_variable" "staging_aws_access_key" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "${var.aws_access_key}"
#   category     = "env"
#   workspace_id = "${tfe_workspace.staging.id}"
# }

# resource "tfe_variable" "development_aws_access_key" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "${var.aws_access_key}"
#   category     = "env"
#   workspace_id = "${tfe_workspace.development.id}"
# }

# resource "tfe_variable" "production_aws_access_key" {
#   key          = "AWS_ACCESS_KEY_ID"
#   value        = "${var.aws_access_key}"
#   category     = "env"
#   workspace_id = "${tfe_workspace.production.id}"
# }

# resource "tfe_variable" "staging_aws_secret_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "${var.aws_secret_key}"
#   category     = "env"
#   sensitive    = "true"
#   workspace_id = "${tfe_workspace.staging.id}"
# }

# resource "tfe_variable" "development_aws_secret_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "${var.aws_secret_key}"
#   category     = "env"
#   sensitive    = "true"
#   workspace_id = "${tfe_workspace.development.id}"
# }

# resource "tfe_variable" "production_aws_secret_key" {
#   key          = "AWS_SECRET_ACCESS_KEY"
#   value        = "${var.aws_secret_key}"
#   category     = "env"
#   sensitive    = "true"
#   workspace_id = "${tfe_workspace.production.id}"
# }

# resource "tfe_variable" "workspace_var_staging" {
#   key      = "workspace_name"
#   value    = "${var.creator_workspace}"
#   category = "terraform"

#   workspace_id = "${tfe_workspace.staging.id}"
# }

# resource "tfe_variable" "workspace_var_development" {
#   key      = "workspace_name"
#   value    = "${var.creator_workspace}"
#   category = "terraform"

#   workspace_id = "${tfe_workspace.development.id}"
# }

# resource "tfe_variable" "workspace_var_production" {
#   key      = "workspace_name"
#   value    = "${var.creator_workspace}"
#   category = "terraform"

#   workspace_id = "${tfe_workspace.production.id}"
# }

# resource "tfe_variable" "org_var_production" {
#   key          = "org"
#   value        = "${var.org}"
#   category     = "terraform"
#   workspace_id = "${tfe_workspace.production.id}"
# }

# resource "tfe_variable" "confirm_destroy1" {
#   key          = "CONFIRM_DESTROY"
#   value        = "1"
#   category     = "env"
#   workspace_id = "${tfe_workspace.development.id}"
# }

# resource "tfe_variable" "confirm_destroy2" {
#   key          = "CONFIRM_DESTROY"
#   value        = "1"
#   category     = "env"
#   workspace_id = "${tfe_workspace.staging.id}"
# }

# resource "tfe_variable" "confirm_destroy3" {
#   key          = "CONFIRM_DESTROY"
#   value        = "1"
#   category     = "env"
#   workspace_id = "${tfe_workspace.production.id}"
# }

# resource "tfe_variable" "set_ttl1" {
#   key          = "WORKSPACE_TTL"
#   value        = "30"
#   category     = "env"
#   workspace_id = "${tfe_workspace.development.id}"
# }

# resource "tfe_variable" "set_ttl2" {
#   key          = "WORKSPACE_TTL"
#   value        = "30"
#   category     = "env"
#   workspace_id = "${tfe_workspace.staging.id}"
# }

# resource "tfe_variable" "set_ttl3" {
#   key          = "WORKSPACE_TTL"
#   value        = "30"
#   category     = "env"
#   workspace_id = "${tfe_workspace.production.id}"
# }

# resource "tfe_variable" "org_var_development" {
#   key          = "org"
#   value        = "${var.org}"
#   category     = "terraform"
#   workspace_id = "${tfe_workspace.development.id}"
# }

# resource "tfe_variable" "org_var_staging" {
#   key      = "org"
#   value    = "${var.org}"
#   category = "terraform"

#   workspace_id = "${tfe_workspace.staging.id}"
# }

# resource "tfe_variable" "environment_name_dev" {
#   key      = "environment"
#   value    = "dev"
#   category = "terraform"

#   workspace_id = "${tfe_workspace.development.id}"
# }

# resource "tfe_variable" "environment_name_stage" {
#   key      = "environment"
#   value    = "stage"
#   category = "terraform"

#   workspace_id = "${tfe_workspace.staging.id}"
# }

# resource "tfe_variable" "environment_name_prod" {
#   key      = "environment"
#   value    = "prod"
#   category = "terraform"

#   workspace_id = "${tfe_workspace.production.id}"
# }

# resource "tfe_variable" "name_dev" {
#   key      = "name"
#   value    = "${var.use_case_name}"
#   category = "terraform"
#   workspace_id = "${tfe_workspace.development.id}"
# }

# resource "tfe_variable" "name_staging" {
#   key      = "name"
#   value    = "${var.use_case_name}"
#   category = "terraform"
#   workspace_id = "${tfe_workspace.staging.id}"
# }

# resource "tfe_variable" "name_prod" {
#   key      = "name"
#   value    = "${var.use_case_name}"
#   category = "terraform"
#   workspace_id = "${tfe_workspace.production.id}"
# }
