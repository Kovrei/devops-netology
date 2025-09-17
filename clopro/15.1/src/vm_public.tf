resource "yandex_compute_instance" "public" {

  name = local.vm_name2

  platform_id = var.platform_id

  resources {
    cores         = var.vms_resources.public.cores
    memory        = var.vms_resources.public.memory
    core_fraction = var.vms_resources.public.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-2004-lts.image_id
      type     = var.vms_resources.public.disk.type
      size     = var.vms_resources.public.disk.size
    }
  }

  metadata = local.metadata

  scheduling_policy {
    preemptible = var.vms_resources.public.preemptible
  }

  network_interface {
    nat                = var.vms_resources.public.nat
    subnet_id          = yandex_vpc_subnet.public.id
    security_group_ids = [yandex_vpc_security_group.nat-instance-sg.id]
  }

  allow_stopping_for_update = var.vms_resources.public.allow_stopping_for_update
}

