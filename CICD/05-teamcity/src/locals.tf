locals {
  ssh-keys = "aos:${file("~/.ssh/vm1.pub")}"
}