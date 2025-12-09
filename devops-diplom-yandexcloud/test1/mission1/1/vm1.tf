resource "yandex_compute_instance" "nat_instance" {

  name = local.vm_name1

  platform_id = var.platform_id

  resources {
    cores         = var.vms_resources.nat_instance.cores
    memory        = var.vms_resources.nat_instance.memory
    core_fraction = var.vms_resources.nat_instance.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_nat_instance
      type     = var.vms_resources.nat_instance.disk.type
      size     = var.vms_resources.nat_instance.disk.size
    }
  }

  metadata = local.metadata


  scheduling_policy {
    preemptible = var.vms_resources.nat_instance.preemptible
  }

  network_interface {
    nat                = var.vms_resources.nat_instance.nat
    subnet_id          = yandex_vpc_subnet.public.id
    ip_address         = var.internal_IP
  }

  allow_stopping_for_update = var.vms_resources.nat_instance.allow_stopping_for_update
}