#output "vm_info" {
#  value = [
#    for instance in [
#      yandex_compute_instance.web,
#      yandex_compute_instance.double_vm
#      ] : {
#      instance_name = instance.name,
#      external_ip   = instance.network_interface.0.nat_ip_address,
#      fqdn          = instance.fqdn
#    }
#  ]
#}

#output "info1_web" {
#  value = yandex_compute_instance.web.name
#}
#output "info2_web" {
#  value = yandex_compute_instance.web.network_interface.0.nat_ip_address
#}
#output "info3_web" {
#  value = yandex_compute_instance.web.fqdn
#}
#
#output "info1_double_instance" {
#  value = yandex_compute_instance.double_instance.name
#}
#output "info2_double_instance" {
#  value = yandex_compute_instance.double_instance.network_interface.0.nat_ip_address
#}
#output "info3_double_instance" {
#  value = yandex_compute_instance.double_instance.fqdn
#}