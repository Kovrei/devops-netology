resource "local_file" "hosts_templatefile" {
  content = templatefile(

    "${path.module}/hosts.tftpl",
    {
      webservers = yandex_compute_instance.web,
      databases  = yandex_compute_instance.double_vm,
      storage    = yandex_compute_instance.storage
    }
  )

  filename = "${abspath(path.module)}/inventory.ini"
}
