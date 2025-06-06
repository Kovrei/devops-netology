output "vpc_ip" {
  value = {
    for k, v in yandex_compute_instance.cicd : k => v.network_interface.0.nat_ip_address
  }
}

#output "vm_info" {
#  value = [
#    for instance in [
#      yandex_compute_instance.cicd
#      ] : {
#      instance_name = instance.name,
#      external_ip   = instance.network_interface.0.nat_ip_address,
#      fqdn          = instance.fqdn
#    }
#  ]
#}