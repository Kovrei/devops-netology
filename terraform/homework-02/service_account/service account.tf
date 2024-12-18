// Создание сервисного аккаунта
resource "yandex_iam_service_account" "sa" {
  name      = "hw-02"
  #folder_id = var.folder_id
}

// Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-role" {
  folder_id = var.folder_id
  role      = "editor"
  member = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Create authorisation key for service account
resource "yandex_iam_service_account_key" "sa-auth-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "authorisation key service account"
  #key_algorithm      = "<алгоритм_генерации_ключа>"
  #pgp_key            = "<pgp-ключ>"
}


#// Создание статического ключа доступа
#resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
#  service_account_id = yandex_iam_service_account.sa.id
#  description        = "static access key for object storage"
#}

#resource "yandex_organizationmanager_os_login_settings" "my_os_login_settings" {
#  organization_id = var.organization_id
#  ssh_certificate_settings {
#    enabled = true
#  }
#  user_ssh_key_settings {
#    enabled               = true
#    allow_manage_own_keys = true
#  }
#}

#resource "yandex_organizationmanager_user_ssh_key" "my_user_ssh_key" {
#  organization_id = var.organization_id
#  subject_id      = var.subject_id
#  data            = var.ssh_key_public
#  name            = "vm1.pub" 
#  #expires_at      = "<срок_действия_ключа>"
#}