variable "ah_dc" {
  description = "datacenter region"
  default = "ams1"
  type = string
}

variable "ah_token" {
  description = "access token"
  type = string
}

variable "ah_product" {
  description = "node size"
  default     = "start-xs"
  type = string
}

variable "ah_image" {
  description = "Disk image"
  type = string
}

variable "ah_ssh_keys" {
  description = "ssh key for nodes"
}

variable "node_count" {
  description = "instance count"
  default     = "1"
}

variable "ssh_user" {
  description = "ssh user for vm management"
  default     = "adminroot"
  type = string
}

variable "inventory_file" {
  description = "ansible dynamic inventory file name"
  default     = "hosts"
  type = string
}

variable "web_provision_yml" {
  description = "ansible role for web server"
  default     = "web.yml"
  type = string
}
