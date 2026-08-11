output "repo_names" {
  description = "Names of the GitHub repositories created"

  value = {
    for key, repo in github_repository.devops_repo :
    key => repo.name
  }
}

output "repo_urls" {
  description = "URLs of the GitHub repositories created"

  value = {
    for key, repo in github_repository.devops_repo :
    key => repo.html_url
  }
}

output "repo_ids" {
  description = "IDs of the GitHub repositories created"

  value = {
    for key, repo in github_repository.devops_repo :
    key => repo.node_id
  }
}