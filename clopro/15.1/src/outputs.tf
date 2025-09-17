output "vpc_name" {
  value = yandex_vpc_network.netology-vpc.name
}

output "vpc_id" {
  value = yandex_vpc_network.netology-vpc.id
}

output "subnet_public" {
  value = yandex_vpc_subnet.public.v4_cidr_blocks
}

output "nat_instance_internalIP" {
  value = yandex_compute_instance.nat_instance.network_interface.0.ip_address
}
output "nat_instance_externalIP" {
  value = yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address
}

output "public_internalIP" {
  value = yandex_compute_instance.public.network_interface.0.ip_address
}
output "public_externalIP" {
  value = yandex_compute_instance.public.network_interface.0.nat_ip_address
}

output "subnet_private" {
  value = yandex_vpc_subnet.private.v4_cidr_blocks
}

output "private_internalIP" {
  value = yandex_compute_instance.private.network_interface.0.ip_address
}
output "private_externalIP" {
  value = yandex_compute_instance.private.network_interface.0.nat_ip_address
}

