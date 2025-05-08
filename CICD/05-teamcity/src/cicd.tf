#создаем 1 идентичные ВМ через for_each

resource "yandex_compute_instance" "cicd" {

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
      image_id = data.yandex_compute_image.centos7.image_id
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

  allow_stopping_for_update = each.value.allow_stopping_for_update
}