resource "yandex_compute_image" "ubuntu_2004" {
  source_family = "ubuntu-2004-lts"
}

resource "yandex_compute_disk" "boot-disk-vm" {
  name     = "boot-disk"
  type     = "network-hdd"
  size     = "10"
  zone     = "ru-central1-a"
  image_id = yandex_compute_image.ubuntu_2004.id
}

resource "yandex_compute_instance" "vm" {
  name     = "docker"
  hostname = "docker"
  zone     = "ru-central1-a"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk-vm.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }

  scheduling_policy {
    preemptible = true
  }
}