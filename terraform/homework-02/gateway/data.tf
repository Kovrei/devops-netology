data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_ubuntu
}

data "yandex_compute_image" "ubuntu-db" {
  family = var.vm_db_ubuntu
}
