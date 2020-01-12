# Modern Cloud Development Workshop

## Terraform IaC

### Remote State Storage

Each variation outlined below is designed to store the Terraform state in Azure blob storage. As part
of that, you must configure and initialize things appropriately. To do so, you will need to update the
values in a file called `sample-backend-secrets.tfvars` and remove the `sample-` from the file name.

> NOTE: Do not check this file into your git repo!

Now you can initialize Terraform, specifying the file above for the config.

```bash
terraform init --backend-config backend-secrets.tfvars
```

## Execute Terraform

```bash
terraform apply
```
