output "nginx_nodes_external_ip" {
  value = ah_cloud_server.nginx-node.*.ips.0.ip_address
}

output "db_external_ip" {
  value = ah_cloud_server.db.*.ips.0.ip_address
}

