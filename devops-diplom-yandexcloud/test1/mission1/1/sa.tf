
// Создание сервисного аккаунта
resource "yandex_iam_service_account" "sa" {
  name = "netology"
  #folder_id = var.folder_id
}

// Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-role" {
  folder_id = var.folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Create authorisation key for service account
resource "yandex_iam_service_account_key" "sa-auth-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "authorisation key service account"
  #key_algorithm      = "<алгоритм_генерации_ключа>"
  #pgp_key            = "<pgp-ключ>"
}