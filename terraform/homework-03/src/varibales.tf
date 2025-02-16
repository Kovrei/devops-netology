

### common vars ###


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "ubuntu2004" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "install ubuntu"
}

variable "platform_id" {
  description = "Hardware CPU platform name (Intel Ice Lake by default)"
  type        = string
  default     = "standard-v1"
}


### boot_disk parametrs ###


variable "disk_size" {
  description = "Disk size"
  type        = number
  default     = 1
}

variable "disk_type" {
  description = "Disk size"
  type        = string
  default     = "network-hdd"
}


### resources instance web for count ###

variable "name_vm" {
  type = list(string)
  default = [
    "web-1",
    "web-2"
  ]
  description = "the total number of creating count instance"
}

variable "web_cores" {
  description = "Cores allocated to instance"
  type        = number
  default     = 2
}
variable "web_memory" {
  description = "Memory allocated to instance (in Gb)"
  type        = number
  default     = 1
}
variable "web_core_fraction" {
  description = "Core fraction applied to instance"
  type        = number
  default     = 20
}

variable "web_disk_type" {
  description = "Disk type to instance"
  type        = string
  default     = "network-hdd"
}

variable "web_disk_size" {
  description = "Disk size to instance"
  type        = number
  default     = 5
}

variable "web_preemptible" {
  description = "sheduling police preemptible"
  type        = bool
  default     = true
}

variable "web_nat" {
  description = "network_interface nat"
  type        = bool
  default     = true
}

variable "web_allow_stopping_for_update" {
  description = "работу ресурса можно останавливать для внесения изменений"
  type        = bool
  default     = true
}


### resources instance double vm ###


variable "each_vm" {
  type = map(object({
    index_name    = string
    cores         = number
    memory        = number
    core_fraction = number
    disk_size     = number
    disk_type     = string
    preemptible   = bool
    nat           = bool
    allow_stopping_for_update = bool
  }))

  default = {
    "main" = {
      index_name    = "main"
      cores         = 2
      memory        = 1
      core_fraction = 20
      disk_size     = 5
      disk_type     = "network-hdd"
      preemptible   = true
      nat           = true
      allow_stopping_for_update = true
    }

    "replica" = {
      index_name    = "replica"
      cores         = 2
      memory        = 1
      core_fraction = 20
      disk_size     = 5
      disk_type     = "network-hdd"
      preemptible   = true
      nat           = true
      allow_stopping_for_update = true
    }
  }
  description = "the double main of creating instance"
}


### resources instance storage vm ###

variable "storage_name" {
  description = "VM name"
  type        = string
  default     = "storage"
}

variable "storage_hostname" {
  description = "VM hostname"
  type        = string
  default     = "storage"
}

variable "storage_cores" {
  description = "Cores allocated to instance"
  type        = number
  default     = 2
}
variable "storage_memory" {
  description = "Memory allocated to instance (in Gb)"
  type        = number
  default     = 1
}
variable "storage_core_fraction" {
  description = "Core fraction applied to instance"
  type        = number
  default     = 20
}

variable "storage_disk_type" {
  description = "Disk type to instance"
  type        = string
  default     = "network-hdd"
}

variable "storage_disk_size" {
  description = "Disk size to instance"
  type        = number
  default     = 5
}

variable "storage_preemptible" {
  description = "sheduling police preemptible"
  type        = bool
  default     = true
}

variable "storage_nat" {
  description = "network_interface nat"
  type        = bool
  default     = true
}

variable "storage_allow_stopping_for_update" {
  description = "работу ресурса можно останавливать для внесения изменений"
  type        = bool
  default     = true
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

