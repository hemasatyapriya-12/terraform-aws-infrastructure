terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~>2.5"
    }
  }

  required_version = ">= 1.5.0"
}

provider "local" {}

resource "local_file" "welcome_file" {
  filename = var.file_name
  content  = var.file_content
}