all:
  children:
    webservers:
      hosts:
    %{ for ip in ips ~}
      ${ip}
    %{ endfor ~}