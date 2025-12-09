resource "yandex_compute_instance" "k8s-cluster" {
  
  count = length(var.name_vm)
  
  platform_id               = "standard-v2"
  name                      = var.name_vm[count.index]
  zone                      = var.subnet-zones[count.index]
  hostname                  = var.name_vm[count.index]
  allow_stopping_for_update = true
  labels = {
    index = "${count.index}"
  }

  scheduling_policy {
    preemptible = true
  }

  resources {
    cores  = 4
    memory = 4
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = var.OS
      type     = "network-hdd"
      size     = "30"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.app-subnet-zones[count.index].id
    nat       = true
  }

  metadata = local.metadata
}