# EKS sample project with Terraform

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=ContainerOnAWS_eks-terraform&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=ContainerOnAWS_eks-terraform) [![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=ContainerOnAWS_eks-terraform&metric=ncloc)](https://sonarcloud.io/summary/new_code?id=ContainerOnAWS_eks-terraform)

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

Update `vpc_id` and `subnet_ids` with VPC module output.

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

find . -name ".terraform" -exec rm -rf {} \;
find . -name "terraform.tfstate" -exec rm -rf {} \;
find . -name ".terraform.lock.hcl" -exec rm -rf {} \;
```

## Reference

* https://github.com/terraform-aws-modules/terraform-aws-vpc

* https://github.com/terraform-aws-modules/terraform-aws-eks

