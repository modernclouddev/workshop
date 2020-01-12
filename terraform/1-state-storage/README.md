# Remote State Storage Setup

```bash

# No remote storage here
terraform init

# Apply with prompts for variable names
terraform apply

# Additionally, you can specify the variables like this
terraform apply -var 'resource_group_name=cdw-tfstate-20200111' -var 'storage_account_name=cdwtfstatestorage' -var 'blob_container_name=modernclouddev' -var 'location=westus2'
```