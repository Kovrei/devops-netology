resource "yandex_compute_instance" "bastion" {

  name = local.bastion_name

  platform_id = var.platform_id

  resources {
    cores         = var.vm_k8s_cluster.bastion.cores
    memory        = var.vm_k8s_cluster.bastion.memory
    core_fraction = var.vm_k8s_cluster.bastion.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_bastion
      type     = var.vm_k8s_cluster.bastion.disk.type
      size     = var.vm_k8s_cluster.bastion.disk.size
    }
  }

  metadata = local.metadata

  scheduling_policy {
    preemptible = var.vm_k8s_cluster.bastion.preemptible
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.bastion-nat["subnet-pub-a"].id
    security_group_ids = [yandex_vpc_security_group.nat-instance-sg.id]
    nat                = var.vm_k8s_cluster.bastion.nat
  }

  allow_stopping_for_update = var.vm_k8s_cluster.bastion.allow_stopping_for_update
}