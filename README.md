# EKS sample project with Terraform

[![Build](https://github.com/DevSecOpsSamples/eks-terraform/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/DevSecOpsSamples/eks-terraform/actions/workflows/build.yml)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=DevSecOpsSamples_eks-terraform&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=DevSecOpsSamples_eks-terraform) [![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=DevSecOpsSamples_eks-terraform&metric=ncloc)](https://sonarcloud.io/summary/new_code?id=DevSecOpsSamples_eks-terraform)

![eks-terraform](./screenshots/eks-terraform.png?raw=true)

### Step 1: VPC

Deploy a new VPC:

```bash
cd 01-vpc
terraform init
terraform plan
terraform apply
```

[01-vpc/main.tf](./01-vpc/main.tf)

### Step 2: EKS cluster and nodegroup

Update `vpc_id` and `subnet_ids` with VPC module output.

Deploy a new EKS cluster and nodegroup:

```bash
cd ../02-eks
terraform init
terraform plan
terraform apply
```

[02-eks/main.tf](./02-eks/main.tf)

### Step 3: Update kubectl context

```bash

```

### Step 4: Build the SpringBoot Ping API

Build and push to ECR:

```bash
cd ../app
./buiid.sh
```

[04-app/build.sh](./04-app/build.sh)

### Step 5: Deploy the API

Create a YAML file for K8s Deployment, Service, HorizontalPodAutoscaler, and Ingress using a template file.

```bash
sed -e "s|<account-id>|${ACCOUNT_ID}|g" ping-api-template.yaml | sed -e "s|<region>|${REGION}|g" > ping-api.yaml
cat ping-api.yaml
kubectl apply -f ping-api.yaml
```

[04-app/ping-api-template.yaml](./04-app/ping-api-template.yaml)

## Cleanup

```bash
cd 02-eks
terraform destroy

cd ../01-vpc
terraform destroy

find . -name ".terraform" -exec rm -rf {} \;
find . -name "terraform.tfstate" -exec rm -rf {} \;
find . -name ".terraform.lock.hcl" -exec rm -rf {} \;
```

## Reference

* https://github.com/terraform-aws-modules/terraform-aws-vpc

* https://github.com/terraform-aws-modules/terraform-aws-eks
