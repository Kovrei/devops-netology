### cloud db
variable "vm_db_instance_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

### instance db

variable "vm_db_ubuntu" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "install ubuntu"
}

variable "vm_db_name_instance" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "instance name"
}

#variable "vm_db_platform_id" {
#  description = "Hardware CPU platform name (Intel Ice Lake by default)"
#  type        = string
#  default     = "standard-v3"
#}

#variable "vm_db_cores" {
#  description = "Cores allocated to instance"
#  type        = number
#  default     = 2
#}

#variable "vm_db_memory" {
#  description = "Memory allocated to instance (in Gb)"
#  type        = number
#  default     = 2
#}

#variable "vm_db_core_fraction" {
#  description = "Core fraction applied to instance"
#  type        = number
#  default     = 20
#}

### network db

variable "vm_db_vpc_name_subnet" {
  type        = string
  default     = "subnet-b"
  description = "VPC network & subnet name"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
