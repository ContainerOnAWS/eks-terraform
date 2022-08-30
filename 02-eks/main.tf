module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                    = "eks-terraform"
  cluster_version                 = "1.21"
  cluster_endpoint_private_access = false
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

  // vpc_id     = module.vpc.vpc_id
  // subnet_ids = module.vpc.private_subnets

  vpc_id     = "vpc-0af55e603924ea9e2"
  subnet_ids = [ "subnet-0a33480e7684260a7", "subnet-0dae1739caeed8ced", "subnet-0e6b836c30dd7e186" ]
  
  cloudwatch_log_group_retention_in_days = 1

  fargate_profiles = {
    default = {
      name = "default"
      selectors = [
        {
          namespace = "kube-system"
        },
        {
          namespace = "default"
        }
      ]
    }
  }
}