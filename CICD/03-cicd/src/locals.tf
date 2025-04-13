locals {
  ssh-keys = "vm1:${file("~/.ssh/vm1.pub")}"
}