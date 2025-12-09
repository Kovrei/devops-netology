resource "yandex_compute_instance" "master" {

  name = local.master_name

  platform_id = var.platform_id

  resources {
    cores         = var.vm_k8s_cluster.master.cores
    memory        = var.vm_k8s_cluster.master.memory
    core_fraction = var.vm_k8s_cluster.master.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      type     = var.vm_k8s_cluster.master.disk.type
      size     = var.vm_k8s_cluster.master.disk.size
    }
  }

  metadata = local.metadata

  scheduling_policy {
    preemptible = var.vm_k8s_cluster.master.preemptible
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnets["subnet-a"].id
    security_group_ids = [yandex_vpc_security_group.nat-instance-sg.id]
    nat                = var.vm_k8s_cluster.master.nat
  }

  allow_stopping_for_update = var.vm_k8s_cluster.master.allow_stopping_for_update
}