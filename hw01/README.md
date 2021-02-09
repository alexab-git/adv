# Terraform

Развертывание инфраструктуры на advacedHosting при помощи Terraform, провижн виртуальных машин на основеansible.

На машине администратора должен быть установлен плагин [advacedHosting](https://github.com/advancedhosting/terraform-provider-ah)

Развертывание инфраструктуры:
```
terraform init
terraform plan
terraform apply 
```

Основные файлы конфигураций:
* [web.tf](web.tf) - манифест по созданию виртуальных машин
* [web.yml](web.yml) - ansible playbook для развертывания nginx на виртуальной машине


