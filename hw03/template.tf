resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tpl",
    {
      nginx-nodes-ip    = ah_cloud_server.nginx-node.*.ips.0.ip_address
      nginx-nodes-name  = ah_cloud_server.nginx-node.*.name
      db-ip      = ah_cloud_server.db.*.ips.0.ip_address
      db-name    = ah_cloud_server.db.*.name
    }
  )
  filename = var.inventory_file
}
