resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tpl",
    {
      gfs-nodes-ip    = ah_cloud_server.gfs-node.*.ips.0.ip_address
      gfs-nodes-name  = ah_cloud_server.gfs-node.*.name
      storage-ip      = ah_cloud_server.storage.*.ips.0.ip_address
      storage-name    = ah_cloud_server.storage.*.name
    }
  )
  filename = var.inventory_file
}
