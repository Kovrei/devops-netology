output "vm_info" {
  value = [
    for instance in [
      yandex_compute_instance.platform-db,
      yandex_compute_instance.platform
      ] : {
      instance_name = instance.name,
      external_ip   = instance.network_interface.0.nat_ip_address,
      fqdn          = instance.fqdn
    }
  ]
}


output "gateway" {
  value = yandex_vpc_gateway.nat_gateway.id
}