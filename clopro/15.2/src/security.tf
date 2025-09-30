resource "yandex_vpc_security_group" "sg-nat-lamp" {
  name       = local.sg_nat_name
  network_id = yandex_vpc_network.netology-vpc.id

  ingress {
    protocol       = "TCP"
    description    = "HTTP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol       = "ANY"
    description    = "Outgoing traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}