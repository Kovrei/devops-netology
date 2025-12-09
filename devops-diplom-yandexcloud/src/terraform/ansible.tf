resource "local_file" "hosts_cfg" {
  #  count = var.exclude_ansible ? 0 : 1
  content = templatefile("inventory.tftpl",
    {
      node = yandex_compute_instance.k8s-cluster
  })

  filename = "./hosts.yaml"
}