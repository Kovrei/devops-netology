### instance-web ###

resource "yandex_compute_instance" "platform" {
  name        = local.name_vm_web
  platform_id = var.vms_resources.web.platform_id


  zone = var.default_zone

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources.web.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-develop.id
    nat       = var.web_nat_option
  }

  metadata = var.metadata
}

### instance-db ###

resource "yandex_compute_instance" "platform-db" {
  name        = local.name_vm_db
  platform_id = var.vms_resources.db.platform_id


  zone = var.vm_db_instance_zone

  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-db.id
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources.db.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-db.id
    nat       = var.db_nat_option
  }

  metadata = var.metadata
}
