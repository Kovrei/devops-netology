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
  default     = "standard-v1"
}

variable "image_ubuntu" {
  type        = string
  default     = "fd8bnguet48kpk4ovt1u"
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


variable "subnet-zones" {
  type = list(string)
  default = [ "ru-central1-a", "ru-central1-b", "ru-central1-d" ]
}

variable "cidr" {
  type = map(list(string))
  default = {
    "cidr" = [ "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24" ]
  }
}

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
        image_id = "fd8bnguet48kpk4ovt1u"
        type = "network-hdd"
        size = 30
      }
      platform_id = "standard-v1"
      preemptible               = true
      nat                       = false
      allow_stopping_for_update = true
    }

    worker-1 = {
      cores         = 4
      memory        = 6
      core_fraction = 20
      count_vms = 2
      disk = {
        image_id = "fd8bnguet48kpk4ovt1u"
        type = "network-hdd"
        size = 30
      }
      platform_id = "standard-v1"
      preemptible               = true
      nat                       = false
      allow_stopping_for_update = true
    }

    worker-2 = {
      cores         = 4
      memory        = 6
      core_fraction = 20
      count_vms = 2
      disk = {
        image_id = "fd8bnguet48kpk4ovt1u"
        type = "network-hdd"
        size = 30
      }
      platform_id = "standard-v1"
      preemptible               = true
      nat                       = false
      allow_stopping_for_update = true
    }

    bastion = {
      cores         = 2
      memory        = 1
      core_fraction = 5
      disk = {
        image_id = "fd8bnguet48kpk4ovt1u"
        type = "network-hdd"
        size = 20
      }
      platform_id = "standard-v1"
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



