resource "yandex_storage_bucket" "busket" {

  depends_on = [
    yandex_iam_service_account.storage-sa,
    yandex_resourcemanager_folder_iam_member.storage_admin
  ]
  tags                  = { project = local.project_name }
  bucket                = local.bucket_name
  folder_id             = var.folder_id
  access_key            = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key            = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  max_size              = var.max_size_bucket
  default_storage_class = var.default_storage_class
  force_destroy         = var.force_destroy

}

