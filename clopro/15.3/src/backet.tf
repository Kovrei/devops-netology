#Создание симметричного ключа для бакета
resource "yandex_kms_symmetric_key" "smk" {
  name              = local.smk_name
  default_algorithm = var.smk_options.default_algorithm
  rotation_period   = var.smk_options.rotation_period
}

resource "yandex_storage_bucket" "basket" {

  depends_on = [
    yandex_iam_service_account.storage-sa,
    yandex_resourcemanager_folder_iam_member.storage_admin
  ]

  bucket                = local.backet_name
  folder_id             = var.folder_id
  access_key            = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key            = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  max_size              = var.max_size_bucket
  default_storage_class = var.default_storage_class
  #acl                   = var.acl
  #force_destroy         = var.force_destroy

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.smk.id
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
}

resource "yandex_storage_object" "object" {

  depends_on = [
    yandex_storage_bucket.basket
  ]

  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = local.backet_name
  key        = var.key_name_object
  source     = var.source_img
}