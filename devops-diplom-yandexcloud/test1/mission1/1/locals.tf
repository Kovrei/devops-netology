locals {
  metadata = {
    "serial-port-enable" = "1"
    "ssh-keys"           = "ubuntu:${file("~/.ssh/vm1.pub")}"
  }
  #ssh-keys     = "ubuntu:${file("~/.ssh/vm1.pub")}"
  network_name     = "netolog-vpc"
  vm_name1         = "nat_instance"
  vm_name2         = "public_vm"
  vm_name3         = "private_vm"
  subnet_name1     = "public-subnet"
  subnet_name2     = "private-subnet"
  sg_nat_name      = "nat-instance-sg"
  route_table_name = "nat-instance-route"
  gateway_name     = "test-gateway"
  vpc_address_name = "test_public_ip"
}