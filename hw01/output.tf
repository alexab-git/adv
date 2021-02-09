output "external_ip" {
  value = ah_cloud_server.web.*.ips.0.ip_address
  
}

