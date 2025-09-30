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
  anonymous_access_flags {
    read        = var.bucket_options.basket.anonymous_access_flags.read
    list        = var.bucket_options.basket.anonymous_access_flags.list
    config_read = var.bucket_options.basket.anonymous_access_flags.config_read
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