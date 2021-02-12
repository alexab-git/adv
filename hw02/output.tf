output "gfs_nodes_external_ip" {
  value = ah_cloud_server.gfs-node.*.ips.0.ip_address
}

output "storage_external_ip" {
  value = ah_cloud_server.storage.*.ips.0.ip_address
}

