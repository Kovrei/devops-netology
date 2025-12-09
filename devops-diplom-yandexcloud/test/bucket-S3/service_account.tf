# Сервисный аккаунт для управления группой ВМ
resource "yandex_iam_service_account" "ig-sa" {
  name        = local.ig_name
  description = "Сервисный аккаунт для управления группой ВМ."
}

resource "yandex_resourcemanager_folder_iam_member" "compute_admin" {
  folder_id = var.folder_id
  role      = var.role_ig
  member    = "serviceAccount:${yandex_iam_service_account.ig-sa.id}"
  depends_on = [
    yandex_iam_service_account.ig-sa,
  ]
}

#Сервисный аккаунт для управления бакетом
resource "yandex_iam_service_account" "storage-sa" {
  name        = local.storage_name
  description = "Сервисный аккаунт для управления бакетом."
}

resource "yandex_resourcemanager_folder_iam_member" "storage_admin" {
  folder_id = var.folder_id
  role      = var.role_storage
  member    = "serviceAccount:${yandex_iam_service_account.storage-sa.id}"
  depends_on = [
    yandex_iam_service_account.storage-sa,
  ]
}

# Создание статического ключа доступа  для бакета
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.storage-sa.id
  description        = "static access key for object storage"
}