all:
  children:
    gfs_nodes:
      hosts:
    %{ for index, name in gfs-nodes-name ~}
      ${name}:
            ansible_host: ${gfs-nodes-ip[index]}
    %{ endfor ~}
storage:
      hosts:
    %{ for index, name in storage-name ~}
      ${name}:
            ansible_host: ${storage-ip[index]}
    %{ endfor ~}