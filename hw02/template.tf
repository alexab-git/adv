resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tpl",
    {
      gfs-nodes-ip = ah_cloud_server.gfs-nodes.*.ips.0.ip_address
      storage-ip = ah_cloud_server.storage.*.ips.0.ip_address
    }
  )
  filename = var.inventory_file
}
