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


