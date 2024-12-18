###cloud vars

variable "cloud_id" {
  type        = string
  default     = "b1gmn2p4njpkb0d2nfok"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gpmvq18drtrb8dtdim"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}


### instance
variable "vm_web_ubuntu" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "install ubuntu"
}

variable "vm_web_name_instance" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "instance name"
}

#variable "vm_web_platform_id" {
#  description = "Hardware CPU platform name (Intel Ice Lake by default)"
#  type        = string
#  default     = "standard-v1"
#}

#variable "vm_web_cores" {
#  description = "Cores allocated to instance"
#  type        = number
#  default     = 2
#}

#variable "vm_web_memory" {
#  description = "Memory allocated to instance (in Gb)"
#  type        = number
#  default     = 4
#}

#variable "vm_web_core_fraction" {
#  description = "Core fraction applied to instance"
#  type        = number
#  default     = 5
#}

### network

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

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJH5P18hx+SKpl9YqcBDJVC1gv/6yN74h3GaJ3r4HOoQ vm1@vm1"
#  description = "ssh-keygen -t ed25519"
#}