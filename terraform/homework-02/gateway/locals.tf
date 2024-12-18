locals {
  name_vm_web = "${var.vm_web_name_instance}-${var.default_zone}"
  name_vm_db  = "${var.vm_db_name_instance}-${var.vm_db_instance_zone}"
}