resource "ah_cloud_server" "gfs-node" {
  count      = var.gfs_node_count
  name       = "gfs-node-${count.index}"
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
}

resource "ah_cloud_server" "storage" {
  name       = "storage-node"
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
}

resource "ah_private_network" "storage" {
  ip_range = "10.10.0.0/24"
  name = "Storage Network"
}

resource "ah_private_network_connection" "storage" {
  cloud_server_id = ah_cloud_server.gfs-node.id
  private_network_id = ah_private_network.storage.id
}


  #provision
  #provisioner "local-exec" {
  #  command = "ansible-playbook -u '${var.ssh_user}' -i '${self.ips.0.ip_address}', '${var.site_provision}'" 
  #}
