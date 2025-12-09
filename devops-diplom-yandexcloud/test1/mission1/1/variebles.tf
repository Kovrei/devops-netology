###################
### common vars ###
###################


variable "token" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}


###################
### options vms ###
###################


variable "platform_id" {
  description = "Hardware CPU platform name (Intel Ice Lake by default)"
  type        = string
  default     = "standard-v1"
}

variable "ubuntu2004" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "install ubuntu"
}

variable "image_nat_instance" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
  description = "install nat-instance"
}


###############
### network ###
###############


variable "network" {
  type = map(any)
  default = {

    "public" = {
      cidr_blocks = ["192.168.10.0/24"]
    }
    "private" = {
      cidr_blocks = ["192.168.20.0/24"]
    }
  }

  description = "Network vpc subnet"
}

variable "internal_IP" {
  type        = string
  default     = "192.168.10.254"
  description = "external IP nat-instance"
}


#####################
### resources vms ###
#####################


variable "vms_resources" {
  type = map(any)

  default = {

    nat_instance = {
      cores         = 2
      memory        = 1
      core_fraction = 5
      disk = {
        type = "network-hdd"
        size = 20
      }
      preemptible               = true
      nat                       = true
      allow_stopping_for_update = true
    }

    public = {
      cores         = 2
      memory        = 1
      core_fraction = 5
      disk = {
        type = "network-hdd"
        size = 20
      }
      preemptible               = true
      nat                       = true
      allow_stopping_for_update = true
    }

    private = {
      cores         = 2
      memory        = 1
      core_fraction = 5
      disk = {
        type = "network-hdd"
        size = 20
      }
      preemptible               = true
      nat                       = false
      allow_stopping_for_update = true
    }
  }
}