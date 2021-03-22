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

variable "ah_image_web" {
  description = "Disk image"
  type = string
}

variable "ah_image_db" {
  description = "Disk image"
  type = string
}

variable "ah_image_client" {
  description = "Disk image"
  type = string
}

variable "ah_ssh_keys" {
  description = "ssh key for nodes"
}

variable "nginx_node_count" {
  description = "instance count"
  default     = "1"
}

variable "db_node_count" {
  description = "instance count"
  default     = "1"
}

variable "client_node_count" {
  description = "instance count"
  default     = "1"
}

variable "db_private_ip_range" {
  description = "Private db network number for ip generation"
  type = string
}

variable "client_private_ip_range" {
  description = "Private client network number for ip generation"
  type = string
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

variable "site_provision_yml" {
  description = "ansible provision"
  default     = "site.yml"
  type = string
}
