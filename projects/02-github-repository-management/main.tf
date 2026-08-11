terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  owner = "hemasatyapriya-12"
}

resource "github_repository" "devops_repo" {
  for_each = var.repositories

  name        = each.key
  description = each.value.description
  visibility  = each.value.visibility
  archived    = each.value.archived

  auto_init = true
}

resource "github_branch_default" "master" {
  for_each = github_repository.devops_repo

  repository = each.value.name
  branch     = "master"
}

resource "github_branch_protection" "master" {
  for_each = github_repository.devops_repo

  repository_id = each.value.node_id
  pattern       = "master"

  required_pull_request_reviews {
    required_approving_review_count = 1
    dismiss_stale_reviews           = true
  }

  enforce_admins = true

  depends_on = [
    github_branch_default.master
  ]
}