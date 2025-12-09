resource "local_sensitive_file" "backend_credentials" {
  filename        = "${path.root}/secret.tfvars"
  file_permission = "0600" # Secure file permissions
  content         = <<-EOT
    access_key = ${yandex_iam_service_account_static_access_key.sa-static-key.access_key}
    secret_key = ${yandex_iam_service_account_static_access_key.sa-static-key.secret_key}
  EOT
  depends_on      = [yandex_iam_service_account_static_access_key.sa-static-key] # Ensure directory is created first
}


# Renders and writes the backend.tf file using a template
resource "local_file" "backend_tf" {
  filename        = "${path.root}/backend.tf" # Save to the project root folder
  file_permission = "0644"                    # Readable by others if necessary (usually fine for backend config)
  # Populates template with values for S3 backend and DynamoDB-compatible locking
  content = templatefile("${path.module}/backend.tftpl", {
    profile   = local.bucket_name
    bucket_id = local.bucket_name,
    key       = "terraform.tfstate"
  })
}
