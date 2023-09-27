provider "aws" {
  region = var.region
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_iam_role" "eks_cluster_role" {
  name = "eks_cluster_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_eks_node_group" "eks_workers" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "example-workers"

  node_group_status = "ACTIVE"

  capacity_type = "ON_DEMAND"

  scaling_config {
    min_size = var.worker_nodes_min
    max_size = var.worker_nodes_max
    desired_size = var.worker_nodes_desired
  }

  remote_access {
    ec2_ssh_key = var.ssh_key_name
  }

  subnet_ids = var.subnet_ids

  instance_types = var.worker_instance_types

#  node_group_iam_role {
#    name = aws_iam_role.eks_node_role.name
#  }

  node_role_arn = aws_iam_role.eks_node_role.arn  # Specify the ARN of the worker node IAM role here
}

resource "aws_iam_role" "eks_node_role" {
  name = "eks_node_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

#output "eks_cluster_id" {
#  value = aws_eks_cluster.eks_cluster.id
#}
#
#output "eks_cluster_endpoint" {
#  value = aws_eks_cluster.eks_cluster.endpoint
#}
#
#output "eks_cluster_security_group_ids" {
#  value = aws_eks_cluster.eks_cluster.vpc_config[0].security_group_ids
#}
