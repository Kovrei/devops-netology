#создаем 2 идентичные ВМ через for_each

resource "yandex_compute_instance" "double_vm" {

  for_each = var.each_vm

  name     = each.value.index_name
  hostname = each.value.index_name

  platform_id = var.platform_id


  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = each.value.disk_type
      size     = each.value.disk_size
    }
  }

  scheduling_policy {
    preemptible = each.value.preemptible
  }

  metadata = {
    ssh-keys = local.ssh-keys
  }

  network_interface {
    nat       = each.value.nat
    subnet_id = yandex_vpc_subnet.develop.id
  }
}

