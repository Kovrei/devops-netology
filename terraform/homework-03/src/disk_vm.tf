# создание 3 дисков
resource "yandex_compute_disk" "boot_disk" {

  count = 3

  name = "disk-${count.index}"
  type = var.disk_type
  zone = var.default_zone
  size = var.disk_size

  labels = {
    environment = "count_disk"
  }
}

# создание ВМ для подключения жестких дисков
resource "yandex_compute_instance" "storage" {

  name        = var.storage_name
  hostname    = var.storage_hostname
  platform_id = var.platform_id


  resources {
    cores         = var.storage_cores
    memory        = var.storage_memory
    core_fraction = var.storage_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.web_disk_type
      size     = var.web_disk_size
    }
  }

  #dynamic "secondary_disk" {
  #  for_each = yandex_compute_disk.boot_disk
  #  content {
  #    disk_id = lookup(secondary_disk.value, "id", null)
  #  }
  #}

  metadata = {
    ssh-keys = local.ssh-keys
  }

  scheduling_policy {
    preemptible = var.web_preemptible
  }

  network_interface {
    nat       = var.storage_nat
    subnet_id = yandex_vpc_subnet.develop.id
  }

  allow_stopping_for_update = var.storage_allow_stopping_for_update

}
