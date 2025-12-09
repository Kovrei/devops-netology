locals {

  metadata = {
    "serial-port-enable" = "1"
    "ssh-keys"           = "ubuntu:${file("~/.ssh/vm1.pub")}"
  }

  ssh-keys      = "ubuntu:${file("~/.ssh/vm1.pub")}"
  network_name  = "diplom-network"
  master_name   = "k8s-master"
  bastion_name  = "bastion"
  worker-1_name = "k8s-worker-1"
  worker-2_name = "k8s-worker-2"
  subnet_name1  = "public-subnet"
  ig_name       = "sa-ig"
  sg_nat_name   = "sg"
  lg_tg_name    = "lg-tg"
  lb_name       = "lb-1"
  smk_name      = "smk"
}


