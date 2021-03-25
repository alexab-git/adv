all:
  children:
    nginx_nodes:
      hosts:
    %{ for index, name in nginx-nodes-name ~}
      ${name}:
            ansible_host: ${nginx-nodes-ip[index]}
    %{ endfor ~}
db:
      hosts:
    %{ for index, name in db-name ~}
      ${name}:
            ansible_host: ${db-ip[index]}
    %{ endfor ~}