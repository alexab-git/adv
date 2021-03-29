resource "ah_cloud_server" "nginx-node" {
  count      = var.nginx_node_count
  name       = "nginx-node-${count.index}"
  datacenter = var.ah_dc
  image      = var.ah_image_web
  product    = var.ah_product
  ssh_keys   = var.ah_ssh_keys
}

resource "ah_cloud_server" "db" {
  name       = "db-node"
  datacenter = var.ah_dc
  image      = var.ah_image_db
  product    = var.ah_product
  ssh_keys   = var.ah_ssh_keys
}

resource "ah_cloud_server" "client-node" {
  count      = var.client_node_count
  name       = "client-node-${count.index}"
  datacenter = var.ah_dc
  image      = var.ah_image_client
  product    = var.ah_product
  ssh_keys   = var.ah_ssh_keys
}

resource "ah_private_network" "dbnet" {
  ip_range = "${var.db_private_ip_range}.0/24"
  name = "Database network"
}

resource "ah_private_network" "webnet" {
  ip_range = "${var.web_private_ip_range}.0/24"
  name = "Web network"
}

resource "ah_private_network_connection" "nginx-nodes-dbnet" {
  depends_on = [ ah_private_network.dbnet, ah_cloud_server.nginx-node ]
  count      = var.nginx_node_count
  cloud_server_id =  ah_cloud_server.nginx-node[count.index].id
  private_network_id = ah_private_network.dbnet.id
  ip_address = "${var.db_private_ip_range}.${count.index+200}"
}

resource "ah_private_network_connection" "db-nodes-dbnet" {
  depends_on = [ ah_private_network.dbnet, ah_cloud_server.db ]
  cloud_server_id =  ah_cloud_server.db.id
  private_network_id = ah_private_network.dbnet.id
  ip_address = "${var.db_private_ip_range}.100"
}

resource "ah_private_network_connection" "nginx-nodes-webnet" {
  depends_on = [ ah_private_network.webnet, ah_private_network.dbnet, ah_cloud_server.nginx-node ]
  count      = var.nginx_node_count
  cloud_server_id =  ah_cloud_server.nginx-node[count.index].id
  private_network_id = ah_private_network.webnet.id
  ip_address = "${var.web_private_ip_range}.${count.index+200}"
}

resource "ah_private_network_connection" "client-nodes-webnet" {
  depends_on = [ ah_private_network.webnet, ah_private_network.dbnet, ah_cloud_server.client-node ]
  count      = var.client_node_count
  cloud_server_id =  ah_cloud_server.client-node[count.index].id
  private_network_id = ah_private_network.webnet.id
  ip_address = "${var.web_private_ip_range}.${count.index+10}"
}
