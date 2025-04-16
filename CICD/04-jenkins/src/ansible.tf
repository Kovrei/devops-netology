resource "local_file" "hosts_templatefile" {

  content = templatefile(

    "${path.module}/hosts.tftpl", {
      cicd = yandex_compute_instance.cicd
    }
  )

  filename = "${abspath(path.module)}/hosts.yml"
}