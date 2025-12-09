###################
### common vars ###
###################


variable "token" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  sensitive   = true
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  sensitive   = true
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  sensitive   = true
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
  default     = "standard-v2"
}

variable "image_id" {
  type        = string
  default     = "fd8bnguet48kpk4ovt1u"
  description = "install instance"
}

variable "image_bastion" {
  type        = string
  default     = "fd85cvp9kpd7b2lhkh1a"
  description = "install nat-instance"
}

variable "ubuntu2204" {
  type        = string
  default     = "ubuntu-2204-lts-oslogin"
  description = "install ubuntu"
}

###############
### network ###
###############

variable "network_spec" {
  type = map(object({
    cidr_block = string
    zone       = string
  }))
  default = {
    "subnet-a" = {
      "cidr_block" = "192.168.101.0/24"
      "zone"       = "ru-central1-a"
    }
    "subnet-b" = {
      "cidr_block" = "192.168.102.0/24"
      "zone"       = "ru-central1-b"
    }
    "subnet-d" = {
      "cidr_block" = "192.168.103.0/24"
      "zone"       = "ru-central1-d"
    }
  }
}

variable "network" {
  type = map(object({
    cidr_block = string
    zone       = string
  }))
  default = {
    "subnet-pub-a" = {
      "cidr_block" = "192.168.100.0/24"
      "zone"       = "ru-central1-a"
    }
  }
}


#variable "subnet_zones" {
#  type    = list(string)
#  default = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
#}
#
#variable "cidr" {
#  type = map(any)
#  default = {
#
#    "master" = {
#      cidr_blocks = ["10.10.1.0/24"]
#    }
#    "worker-1" = {
#      cidr_blocks = ["10.10.2.0/24"]
#    }
#    "worker-2" = {
#      cidr_blocks = ["10.10.3.0/24"]
#    }
#    "bastion" = {
#      cidr_blocks = ["10.10.0.0/24"]
#    }
#
#  }
#
#  description = "cidr vpc subnet"
#}


################################
### resources VMs k8s master ###
################################


variable "vm_k8s_cluster" {
  type = map(any)

  default = {

    master = {
      cores         = 2
      memory        = 4
      core_fraction = 20
      disk = {
        type = "network-hdd"
        size = 30
      }
      preemptible               = true
      nat                       = false
      allow_stopping_for_update = true
    }

    worker-1 = {
      cores         = 4
      memory        = 6
      core_fraction = 20
      disk = {
        type = "network-hdd"
        size = 30
      }
      preemptible               = true
      nat                       = false
      allow_stopping_for_update = true
    }

    worker-2 = {
      cores         = 4
      memory        = 6
      core_fraction = 20
      disk = {
        type = "network-hdd"
        size = 30
      }
      preemptible               = true
      nat                       = false
      allow_stopping_for_update = true
    }

    bastion = {
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
  }
}


#######################
### service account ###
#######################


variable "role_ig" {
  type        = string
  default     = "admin"
  description = "role service account"
}

variable "role_storage" {
  type        = string
  default     = "editor"
  description = "role service account"
}



