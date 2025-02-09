locals {
  ssh-keys = "ubuntu:${file("~/.ssh/vm1.pub")}"
}
