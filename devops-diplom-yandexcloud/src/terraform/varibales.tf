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

variable "bucket" {
  type        = string
  default     = "diplom-osipenkovau"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}


###############
### network ###
###############

variable "subnet-zones" {
  type    = list(string)
  default = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
}

variable "cidr" {
  type = map(list(string))
  default = {
    "cidr" = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  }
}

variable "OS" {
  default = "fd8l04iucc4vsh00rkb1"
}



variable "name_vm" {
  type = list(string)
  default = [
    "master",
    "worker-1",
    "worker-2"
  ]
  description = "the total number of creating count instance"
}