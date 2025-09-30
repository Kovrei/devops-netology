locals {
  metadata = {
    "serial-port-enable" = "1"
    "ssh-keys"           = "ubuntu:${file("~/.ssh/vm1.pub")}"
  }
  ssh-keys     = "ubuntu:${file("~/.ssh/vm1.pub")}"
  network_name = "netolog-vpc"
  group_name1  = "lamp-vm"
  subnet_name1 = "public-subnet"
  ig_name      = "sa-ig"
  storage_name = "sa-storage"
  backet_name  = "auosipenkov"
  sg_nat_name  = "sg"
  lg_tg_name   = "lg-tg"
  lb_name      = "lb-1"
}
