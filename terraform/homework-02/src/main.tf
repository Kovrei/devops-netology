data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_ubuntu
}

data "yandex_compute_image" "ubuntu-db" {
  family = var.vm_db_ubuntu
}

################################################# network

resource "yandex_vpc_network" "develop" {
  name = var.vpc_name_network
}

resource "yandex_vpc_subnet" "subnet-develop" {
  name           = var.vpc_name_subnet
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "subnet-db" {
  name           = var.vm_db_vpc_name_subnet
  zone           = var.vm_db_instance_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_cidr
}

################################################## instance-web
resource "yandex_compute_instance" "platform" {
  name = local.name_vm_web
  #platform_id = var.vm_web_platform_id
  platform_id = var.vms_resources.web.platform_id


  zone = var.default_zone

  resources {
    #cores         = var.vm_web_cores
    #memory        = var.vm_web_memory
    #core_fraction = var.vm_web_core_fraction
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu-db.id
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources.web.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-develop.id
    nat       = true
  }

  metadata = var.metadata
}

################################################## instance-db

resource "yandex_compute_instance" "platform-db" {
  name = local.name_vm_db
  #platform_id = var.vm_db_platform_id
  platform_id = var.vms_resources.db.platform_id


  zone = var.vm_db_instance_zone

  resources {
    #cores         = var.vm_db_cores
    #memory        = var.vm_db_memory
    #core_fraction = var.vm_db_core_fraction
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources.db.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-db.id
    nat       = true
  }

  metadata = var.metadata
}

