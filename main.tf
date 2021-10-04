# resource "tfe_organization_membership" "developer" {
#   organization = var.org
#   email        = "harrison.milesj+developer@gmail.com"
# }

# resource "tfe_team" "developers" {
#   name         = "developers"
#   organization = var.org
# }

# resource "tfe_team_organization_member" "developer" {
#   team_id                    = tfe_team.developers.id
#   organization_membership_id = tfe_organization_membership.developer.id
# }

# resource "tfe_organization_membership" "ops" {
#   organization = var.org
#   email        = "harrison.milesj+operator@gmail.com"
# }

# resource "tfe_team" "ops" {
#   name         = "ops"
#   organization = var.org
# }

# resource "tfe_team_organization_member" "operator" {
#   team_id                    = tfe_team.ops.id
#   organization_membership_id = tfe_organization_membership.ops.id
# }

# resource "tfe_registry_module" "terraform-tfe-workspace" {
#   vcs_repo {
#     display_identifier = "milesjh/terraform-tfe-workspace"
#     identifier         = "milesjh/terraform-tfe-workspace"
#     oauth_token_id     = var.oauth_token
#   }
# }

# module "corp_it_dev_workspace" {
#   source  = "app.terraform.io/mjh-demo/workspace/tfe"
#   version = "0.0.3"

#   use_case_name          = "corp_it"
#   org                    = var.org
#   vcs_identifier         = var.vcs_identifier
#   oauth_token            = var.oauth_token
#   aws_access_key         = var.aws_access_key
#   aws_secret_key         = var.aws_secret_key
#   arm_client_id          = var.arm_client_id
#   arm_client_secret      = var.arm_client_secret
#   arm_tenant_id          = var.arm_tenant_id
#   arm_subscription_id    = var.arm_subscription_id
#   creator_workspace      = var.creator_workspace
#   tfe_team_developers_id = tfe_team.developers.id
#   tfe_team_ops_id        = tfe_team.ops.id
#   environment            = "dev"
# }

# module "research_dev_workspace" {
#   source  = "app.terraform.io/mjh-demo/workspace/tfe"
#   version = "0.0.3"

#   use_case_name          = "research"
#   org                    = var.org
#   vcs_identifier         = var.vcs_identifier
#   oauth_token            = var.oauth_token
#   aws_access_key         = var.aws_access_key
#   aws_secret_key         = var.aws_secret_key
#   arm_client_id          = var.arm_client_id
#   arm_client_secret      = var.arm_client_secret
#   arm_tenant_id          = var.arm_tenant_id
#   arm_subscription_id    = var.arm_subscription_id
#   creator_workspace      = var.creator_workspace
#   tfe_team_developers_id = tfe_team.developers.id
#   tfe_team_ops_id        = tfe_team.ops.id
#   environment            = "dev"
# }

# module "finance_dev_workspace" {
#   source  = "app.terraform.io/mjh-demo/workspace/tfe"
#   version = "0.0.3"

#   use_case_name          = "finance"
#   org                    = var.org
#   vcs_identifier         = var.vcs_identifier
#   oauth_token            = var.oauth_token
#   aws_access_key         = var.aws_access_key
#   aws_secret_key         = var.aws_secret_key
#   arm_client_id          = var.arm_client_id
#   arm_client_secret      = var.arm_client_secret
#   arm_tenant_id          = var.arm_tenant_id
#   arm_subscription_id    = var.arm_subscription_id
#   creator_workspace      = var.creator_workspace
#   tfe_team_developers_id = tfe_team.developers.id
#   tfe_team_ops_id        = tfe_team.ops.id
#   environment            = "dev"
# }

# module "mfg_dev_workspace" {
#   source  = "app.terraform.io/mjh-demo/workspace/tfe"
#   version = "0.0.3"

#   use_case_name          = "manufacturing"
#   org                    = var.org
#   vcs_identifier         = var.vcs_identifier
#   oauth_token            = var.oauth_token
#   aws_access_key         = var.aws_access_key
#   aws_secret_key         = var.aws_secret_key
#   arm_client_id          = var.arm_client_id
#   arm_client_secret      = var.arm_client_secret
#   arm_tenant_id          = var.arm_tenant_id
#   arm_subscription_id    = var.arm_subscription_id
#   creator_workspace      = var.creator_workspace
#   tfe_team_developers_id = tfe_team.developers.id
#   tfe_team_ops_id        = tfe_team.ops.id
#   environment            = "dev"
# }