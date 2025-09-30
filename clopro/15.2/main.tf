resource "yandex_compute_instance" "lamp" {

  platform_id = var.platform_id

  resources {
    cores         = var.lamp_cores
    memory        = var.lamp_memory
    core_fraction = var.lamp_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_lamp
      type     = var.lamp_disk_type
      size     = var.lamp_disk_size
    }
  }
 
  metadata    = {
    user-data = "${file("meta.yml")}"
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  scheduling_policy {
    preemptible = var.lamp_preemptible
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }

  network_interface {
    nat       = var.lamp_nat
    network_id         = "${yandex_vpc_network.network-1.id}"
    subnet_id = yandex_vpc_subnet.public.id
    security_group_ids = ["<список_идентификаторов_групп_безопасности>"]
  }

  allow_stopping_for_update = var.lamp_allow_stopping_for_update

}