output "eks_cluster_id" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster.eks_cluster.id
}

output "eks_cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "eks_cluster_security_group_ids" {
  description = "Security group IDs associated with the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.vpc_config[0].security_group_ids
}
