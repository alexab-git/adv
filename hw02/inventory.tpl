all:
  children:
    gfs-nodes:
      hosts:
    %{ for ip in gfs-nodes-ip ~}
      ${ip}
    %{ endfor ~}
    storage:
      hosts:
    %{ for ip in storage-ip ~}
      ${ip}
    %{ endfor ~}