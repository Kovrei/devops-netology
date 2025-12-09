############
# worker-1 #
############

resource "yandex_compute_instance" "worker-1" {

  name = local.worker-1_name

  platform_id = var.platform_id

  resources {
    cores         = var.vm_k8s_cluster.worker-1.cores
    memory        = var.vm_k8s_cluster.worker-1.memory
    core_fraction = var.vm_k8s_cluster.worker-1.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      type     = var.vm_k8s_cluster.worker-1.disk.type
      size     = var.vm_k8s_cluster.worker-1.disk.size
    }
  }

  metadata = local.metadata

  scheduling_policy {
    preemptible = var.vm_k8s_cluster.worker-1.preemptible
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnets["subnet-b"].id
    security_group_ids = [yandex_vpc_security_group.nat-instance-sg.id]
    nat                = var.vm_k8s_cluster.worker-1.nat
  }

  allow_stopping_for_update = var.vm_k8s_cluster.worker-1.allow_stopping_for_update
}

############
# worker-2 #
############


resource "yandex_compute_instance" "worker-2" {

  name = local.worker-2_name

  platform_id = var.platform_id

  resources {
    cores         = var.vm_k8s_cluster.worker-2.cores
    memory        = var.vm_k8s_cluster.worker-2.memory
    core_fraction = var.vm_k8s_cluster.worker-2.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      type     = var.vm_k8s_cluster.worker-2.disk.type
      size     = var.vm_k8s_cluster.worker-2.disk.size
    }
  }

  metadata = local.metadata

  scheduling_policy {
    preemptible = var.vm_k8s_cluster.worker-2.preemptible
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnets["subnet-d"].id
    security_group_ids = [yandex_vpc_security_group.nat-instance-sg.id]
    nat                = var.vm_k8s_cluster.worker-2.nat
  }

  allow_stopping_for_update = var.vm_k8s_cluster.worker-2.allow_stopping_for_update
}
