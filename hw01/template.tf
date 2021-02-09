resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tpl",
    {
      ips = ah_cloud_server.web.*.ips.0.ip_address
    }
  )
  filename = var.inventory_file
}
