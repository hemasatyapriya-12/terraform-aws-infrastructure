variable "repositories" {
  description = "A map of GitHub repositories to create"
  type = map(object({
    description = string
    visibility  = string
    archived    = bool
  }))
}