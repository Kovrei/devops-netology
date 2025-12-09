resource "yandex_vpc_network" "diplom-net" {
  name = local.network_name
}

#####################
# Создание подсетей #
#####################


#resource "yandex_vpc_subnet" "ru-central1-a" {
#  zone           = var.subnet_zones[0]
#  name           = "ru-central1-a"
#  network_id     = yandex_vpc_network.diplom-net.id
#  v4_cidr_blocks = var.cidr.master.cidr_blocks
#  route_table_id = yandex_vpc_route_table.nat-instance-route.id
#}
#
#resource "yandex_vpc_subnet" "ru-central1-b" {
#  zone           = "ru-central1-b"
#  name           = "ru-central1-b"
#  network_id     = yandex_vpc_network.diplom-net.id
#  v4_cidr_blocks = var.cidr.worker-1.cidr_blocks
#  route_table_id = yandex_vpc_route_table.nat-instance-route.id
#}
#
#resource "yandex_vpc_subnet" "ru-central1-d" {
#  zone           = "ru-central1-d"
#  name           = "ru-central1-d"
#  network_id     = yandex_vpc_network.diplom-net.id
#  v4_cidr_blocks = var.cidr.worker-2.cidr_blocks
#  route_table_id = yandex_vpc_route_table.nat-instance-route.id
#}
#
#resource "yandex_vpc_subnet" "bastion-nat" {
#  zone           = var.subnet_zones[0]
#  name           = "bastion-nat"
#  network_id     = yandex_vpc_network.diplom-net.id
#  v4_cidr_blocks = var.cidr.bastion.cidr_blocks
#}


resource "yandex_vpc_subnet" "subnets" {
  for_each       = var.network_spec
  name           = each.key
  zone           = each.value["zone"]
  network_id     = yandex_vpc_network.diplom-net.id
  route_table_id = yandex_vpc_route_table.nat-instance-route.id
  v4_cidr_blocks = [each.value["cidr_block"]]
}

resource "yandex_vpc_subnet" "bastion-nat" {
  for_each       = var.network
  name           = each.key
  zone           = each.value["zone"]
  network_id     = yandex_vpc_network.diplom-net.id
  v4_cidr_blocks = [each.value["cidr_block"]]
}

##########################################################
# Создание таблицы маршрутизации и статического маршрута #
##########################################################

resource "yandex_vpc_route_table" "nat-instance-route" {
  name       = "nat-instance-route"
  network_id = yandex_vpc_network.diplom-net.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = yandex_compute_instance.bastion.network_interface.0.ip_address
  }
}

resource "yandex_vpc_security_group" "nat-instance-sg" {
  name       = "nat-instance-sg"
  network_id = yandex_vpc_network.diplom-net.id

  egress {
    protocol       = "ANY"
    description    = "any"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol       = "ANY"
    description    = "any"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}