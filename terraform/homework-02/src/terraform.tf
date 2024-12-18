variable "vms_resources" {
  type = map(object({
    platform_id   = string
    cores         = number
    memory        = number
    core_fraction = number
    preemptible   = bool
  }))

  default = {

    "web" = {
      platform_id   = "standard-v1"
      cores         = 2
      memory        = 4
      core_fraction = 5
      preemptible   = true
    },

    "db" = {
      platform_id   = "standard-v3"
      cores         = 2
      memory        = 2
      core_fraction = 20
      preemptible   = true
    }
  }
}

variable "metadata" {
  type = object({
    serial-port-enable = number
    ssh-keys           = string
  })
  default = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJH5P18hx+SKpl9YqcBDJVC1gv/6yN74h3GaJ3r4HOoQ vm1@vm1"
  }
}
