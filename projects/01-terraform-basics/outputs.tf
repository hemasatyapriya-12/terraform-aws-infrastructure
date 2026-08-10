output "created_file_name" {
  description = "The name of the file that was created"
  value       = local_file.welcome_file.filename
}

output "created_file_content" {
  description = "The content of the file that was created"
  value       = local_file.welcome_file.content
}