resource "yandex_compute_instance" "private" {

  name = local.vm_name3

  platform_id = var.platform_id

  resources {
    cores         = var.vms_resources.private.cores
    memory        = var.vms_resources.private.memory
    core_fraction = var.vms_resources.private.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.vms_resources.private.disk.type
      size     = var.vms_resources.private.disk.size
    }
  }

  metadata = local.metadata

  scheduling_policy {
    preemptible = var.vms_resources.private.preemptible
  }

  network_interface {
    nat                = var.vms_resources.private.nat
    subnet_id          = yandex_vpc_subnet.private.id
  }

  allow_stopping_for_update = var.vms_resources.private.allow_stopping_for_update

}