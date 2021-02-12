resource "ah_cloud_server" "gfs-node" {
  count      = var.gfs_node_count
  name       = "gfs-node-${count.index}"
  datacenter = var.ah_dc
  image      = var.ah_image 
  product    = var.ah_product
  ssh_keys   = var.ah_ssh_keys
  
}

resource "ah_cloud_server" "storage" {
  name       = "storage-node"
  datacenter = var.ah_dc
  image      = var.ah_image 
  product    = var.ah_product
  ssh_keys   = var.ah_ssh_keys
  
}

resource "ah_private_network" "storage" {
  ip_range = "${var.private_ip_range}.0/24"
  name = "Storage network"
}

resource "ah_private_network_connection" "gfs-nodes-storage" {
  depends_on = [ ah_private_network.storage, ah_cloud_server.gfs-node ]
  count      = var.gfs_node_count
  cloud_server_id =  ah_cloud_server.gfs-node[count.index].id
  private_network_id = ah_private_network.storage.id
  ip_address = "${var.private_ip_range}.${count.index+200}"

}
resource "ah_private_network_connection" "storage" {
  depends_on = [ ah_private_network.storage, ah_cloud_server.storage ]
  cloud_server_id =  ah_cloud_server.storage.id
  private_network_id = ah_private_network.storage.id
  ip_address = "${var.private_ip_range}.100"

}


  #provision
  #provisioner "local-exec" {
  #  command = "ansible-playbook -u '${var.ssh_user}' -i '${self.ips.0.ip_address}', '${var.site_provision}'" 
  #}
