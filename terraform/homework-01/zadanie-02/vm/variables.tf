variable "token" {
  type        = string
  description = "The ID of YaCloud"
  sensitive   = true
}

variable "metadata-file" {
  type    = string
  default = "./meta.txt"
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "remote-user" {
  type = string
}

variable "ssh_authorized_keys" {
  type = string
}