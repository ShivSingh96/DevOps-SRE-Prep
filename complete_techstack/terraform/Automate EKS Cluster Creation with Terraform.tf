#Scenario: You are tasked to provision an EKS cluster with worker nodes using Terraform. Add an autoscaling group for the nodes and ensure that the state is managed in an S3 bucket.
# Backend Configuration
terraform {
  backend "s3" {
    bucket         = "terraform-eks-state"
    key            = "eks-cluster/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

# Provider Configuration
provider "aws" {
  region = "us-east-1"
}

# EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.27"
  subnets         = ["subnet-123", "subnet-456"]
  vpc_id          = "vpc-abc123"

  worker_groups = [
    {
      instance_type = "t3.medium"
      asg_desired_capacity = 2
      asg_max_size = 5
      asg_min_size = 1
    }
  ]
}

# Output
output "eks_cluster_name" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
#Key Concepts: Autoscaling, S3 state management, AWS EKS modules.
