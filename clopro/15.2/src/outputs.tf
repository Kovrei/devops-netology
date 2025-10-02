output "instance_name" {
  description = "IDs of instances"
  value       = yandex_compute_instance_group.lamp-vm.*.name
}

output "bucket_domain_name" {
  value = yandex_storage_bucket.basket.bucket_domain_name
}

output "backet" {
  value = yandex_storage_bucket.basket.bucket
}

output "object_key" {
  value = yandex_storage_object.object.key
}
output "lb_ip_address" {
  value       = yandex_lb_network_load_balancer.lb-1.listener.*.external_address_spec[0].*.address
  description = "IP-адрес сетевого балансировщика"
}