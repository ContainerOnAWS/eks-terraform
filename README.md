# EKS sample project with Terraform

### Step 1: VPC

Deploy a new VPC:

```bash
cd 01-vpc
terraform init
terraform plan
terraform apply
```

[01-vpc/main.tf](./01-vpc/main.tf)

### Step 2: EKS cluster & nodegroup

Deploy a new EKS cluster & nodegroup:

```bash
cd ../02-eks
terraform init
terraform plan
terraform apply
```

[02-eks/main.tf](./02-eks/main.tf)

## Clean Up

```bash
cd 02-eks
terraform destroy

cd 01-vpc
terraform destroy
```
