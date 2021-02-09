resource "ah_cloud_server" "web" {
  count      = var.node_count
  name       = "web-${count.index}"
  datacenter = var.ah_dc
  image      = var.ah_image 
  product    = var.ah_product
  ssh_keys   = var.ah_ssh_keys
  
  #connect first to check that the vm is powered on
  provisioner "remote-exec" {
    connection {
      host = self.ips.0.ip_address
      type = "ssh"
      user = var.ssh_user
    }
  }

  #provision
  provisioner "local-exec" {
    command = "ansible-playbook -u '${var.ssh_user}' -i '${self.ips.0.ip_address}', '${var.web_provision_yml}'" 
  }
}

