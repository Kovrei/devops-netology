#создаем 2 идентичные ВМ через count
resource "yandex_compute_instance" "web" {

  depends_on = [resource.yandex_compute_instance.double_vm]

  count = length(var.name_vm)

  name     = var.name_vm[count.index]
  hostname = var.name_vm[count.index]

  platform_id = var.platform_id

  resources {
    cores         = var.web_cores
    memory        = var.web_memory
    core_fraction = var.web_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.web_disk_type
      size     = var.web_disk_size
    }
  }

  metadata = {
    ssh-keys = local.ssh-keys
  }

  scheduling_policy {
    preemptible = var.web_preemptible
  }

  network_interface {
    nat       = var.web_nat
    subnet_id = yandex_vpc_subnet.develop.id
  }

  allow_stopping_for_update = var.web_allow_stopping_for_update

}



