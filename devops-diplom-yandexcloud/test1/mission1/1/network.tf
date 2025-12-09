###########
### net ###
###########

resource "yandex_vpc_network" "netology-vpc" {
  name = local.network_name
}

###########
### vpc ###
###########

resource "yandex_vpc_subnet" "public" {
  name           = local.subnet_name1
  zone           = var.default_zone
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = var.network.public.cidr_blocks
}

resource "yandex_vpc_subnet" "private" {
  name           = local.subnet_name2
  zone           = var.default_zone
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = var.network.private.cidr_blocks
  route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

#############
### route ###
#############

resource "yandex_vpc_route_table" "nat-instance-route" {
  name       = local.route_table_name
  network_id = yandex_vpc_network.netology-vpc.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = yandex_compute_instance.nat_instance.network_interface.0.ip_address
  }
}