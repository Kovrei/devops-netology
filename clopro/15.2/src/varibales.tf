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

variable "image_lamp" {
  type        = string
  default     = "fd827b91d99psvq5fjit"
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
  }
  description = "Network vpc subnet"
}


#########################
### resources vm LAMP ###
#########################


variable "name_vm" {
  type = list(string)
  default = [
    "lamp-1",
    "lamp-2",
    "lamp-3"
  ]
  description = "the total number of creating count instance"
}

variable "lamp_cores" {
  description = "Cores allocated to instance"
  type        = number
  default     = 2
}
variable "lamp_memory" {
  description = "Memory allocated to instance (in Gb)"
  type        = number
  default     = 1
}
variable "lamp_core_fraction" {
  description = "Core fraction applied to instance"
  type        = number
  default     = 20
}

variable "lamp_disk_type" {
  description = "Disk type to instance"
  type        = string
  default     = "network-hdd"
}

variable "lamp_disk_size" {
  description = "Disk size to instance"
  type        = number
  default     = 5
}

variable "lamp_preemptible" {
  description = "sheduling police preemptible"
  type        = bool
  default     = true
}

variable "lamp_nat" {
  description = "network_interface nat"
  type        = bool
  default     = true
}

variable "lamp_allow_stopping_for_update" {
  description = "работу ресурса можно останавливать для внесения изменений"
  type        = bool
  default     = true
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
  default     = "storage.admin"
  description = "role service account"
}


#########################
### options for bucket ###
#########################

variable "max_size_bucket" {
  type        = string
  default     = "100000"
  description = " максимальный размер бакета в байтах. Значение по умолчанию — 0, без ограничений."
}

variable "default_storage_class" {
  type        = string
  default     = "standard"
  description = "  класс хранилища. Доступные значения:standard — стандартное хранилище. Значение по умолчанию.cold — холодное хранилище.ice — ледяное хранилище."
}


variable "bucket_options" {
  type = map(any)

  default = {

    basket = {
      anonymous_access_flags = {
        read        = true
        list        = true
        config_read = true
      }
    }
  }
}


#########################
### object for bucket ###
#########################


variable "key_name_object" {
  type        = string
  default     = "1.1.JPG"
  description = "name object img in folder"
}

variable "source_img" {
  type        = string
  default     = "./img/1.1.JPG"
  description = "source file"
}