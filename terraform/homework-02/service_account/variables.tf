### confidentional ###

variable "token" {
  type        = string
  description = "The ID of YaCloud"
  sensitive   = true
}

### provider ###

variable "cloud_id" {
  description = "YC cloud-id. Taken from environment variable."
  default     = "b1gmn2p4njpkb0d2nfok"
}

variable "folder_id" {
  type    = string
  default = "b1gpmvq18drtrb8dtdim"
}

