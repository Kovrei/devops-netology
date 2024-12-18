### cloud ###

variable "cloud_id" {
  description = "YC cloud-id. Taken from environment variable."
  default     = "b1gmn2p4njpkb0d2nfok"
}

variable "folder_id" {
  type    = string
  default = "b1gpmvq18drtrb8dtdim"
}



### zone ###

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_instance_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}


### instance ###

variable "vm_web_ubuntu" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "install ubuntu"
}

variable "vm_db_ubuntu" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "install ubuntu"
}

variable "vm_web_name_instance" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "instance name"
}

variable "vm_db_name_instance" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "instance name"
}



### resources ###

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



### network ###

variable "vpc_name_network" {
  type        = string
  default     = "network-develop"
  description = "VPC network & subnet name"
}

variable "vpc_name_subnet" {
  type        = string
  default     = "subnet-develop"
  description = "VPC network & subnet name"
}

variable "vm_db_vpc_name_subnet" {
  type        = string
  default     = "subnet-db"
  description = "VPC network & subnet name"
}

variable "web_nat_option" {
  type        = bool
  default     = false
  description = "resource/web/nat=false(true)"
}

variable "db_nat_option" {
  type        = bool
  default     = false
  description = "resource/db/nat=false(true)"
}


variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}


variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.1.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}



### ssh ###

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
