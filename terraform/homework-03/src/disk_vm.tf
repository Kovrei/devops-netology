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

  for_each = var.each_storage

  name        = each.value.index_name
  hostname    = each.value.index_name
  platform_id = var.platform_id
  zone        = var.default_zone

  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.boot_disk
    content {
      disk_id = lookup(secondary_disk.value, "id", null)
    }
  }

  metadata = {
    ssh-keys = local.ssh-keys
  }

  scheduling_policy {
    preemptible = var.web_preemptible
  }

  network_interface {
    nat       = each.value.nat
    subnet_id = yandex_vpc_subnet.develop.id
  }
}
