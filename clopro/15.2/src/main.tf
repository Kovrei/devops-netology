resource "yandex_compute_instance_group" "lamp-vm" {

  depends_on = [
    yandex_iam_service_account.ig-sa,
    yandex_resourcemanager_folder_iam_member.compute_admin,
    yandex_storage_object.object
  ]

  name               = local.group_name1
  folder_id          = var.folder_id
  service_account_id = yandex_iam_service_account.ig-sa.id
  #deletion_protection = "<защита_от_удаления>"
  instance_template {

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

    #service_account_id = yandex_iam_service_account.storage-sa.id

    metadata = {
      user-data = "${file("meta.yml")}"
    }

    scheduling_policy {
      preemptible = var.lamp_preemptible
    }

    network_interface {
      nat                = var.lamp_nat
      network_id         = yandex_vpc_network.netology-vpc.id
      subnet_ids         = ["${yandex_vpc_subnet.public.id}"]
      security_group_ids = [yandex_vpc_security_group.sg-nat-lamp.id]
    }

  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  allocation_policy {
    zones = [var.default_zone]
  }

  deploy_policy {
    max_unavailable = 1
    max_creating    = 3
    max_expansion   = 1
    max_deleting    = 1
  }

  health_check {
    interval            = 60 # Интервал между проверками. Указывается в секундах. Не рекомендуется указывать большие значения. Иначе долго будет подниматься группа.
    timeout             = 10 # Указывается в секундах
    healthy_threshold   = 2  # Количество успешных запросов после которых экземпляр признается успешным
    unhealthy_threshold = 2  # Количество неуспешных запросов после которых экземпляр признается неуспешным
    http_options {
      port = 80
      path = "/"
    }
  }

  load_balancer {
    target_group_name = local.lg_tg_name
  }

}