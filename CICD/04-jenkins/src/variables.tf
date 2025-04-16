

### common vars ###

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

variable "centos7" {
  type        = string
  default     = "centos-7-oslogin"
  description = "install centos7"
}

variable "platform_id" {
  description = "Hardware CPU platform name (Intel Ice Lake by default)"
  type        = string
  default     = "standard-v3"
}



### resources instance double vm ###


variable "each_vm" {
  type = map(object({
    index_name                = string
    cores                     = number
    memory                    = number
    core_fraction             = number
    disk_size                 = number
    disk_type                 = string
    preemptible               = bool
    nat                       = bool
    allow_stopping_for_update = bool
  }))

  default = {
    "jenkins_m" = {
      index_name                = "jenkins-master-01"
      cores                     = 2
      memory                    = 4
      core_fraction             = 20
      disk_size                 = 10
      disk_type                 = "network-hdd"
      preemptible               = true
      nat                       = true
      allow_stopping_for_update = true
    }

    "jenkins_a" = {
      index_name                = "jenkins-agent-01"
      cores                     = 2
      memory                    = 4
      core_fraction             = 20
      disk_size                 = 10
      disk_type                 = "network-hdd"
      preemptible               = true
      nat                       = true
      allow_stopping_for_update = true
    }
  }
  description = "the double main of creating instance"
}

### network ###


variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}