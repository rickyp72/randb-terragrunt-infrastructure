variable "region" {
  description = "AWS region"
  default     = "us-west-2"  # Change to your desired region
}

variable "cluster_name" {
  description = "EKS cluster name"
  default     = "my-eks-cluster"
}

variable "subnet_ids" {
  description = "List of subnet IDs for EKS cluster"
  type        = list(string)
}

variable "worker_nodes_min" {
  description = "Minimum number of worker nodes"
  default     = 2
}

variable "worker_nodes_max" {
  description = "Maximum number of worker nodes"
  default     = 5
}

variable "worker_nodes_desired" {
  description = "Desired number of worker nodes"
  default     = 2
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair for worker nodes"
  default     = "my-ssh-key"
}

variable "worker_instance_types" {
  description = "List of EC2 instance types for worker nodes"
  type        = list(string)
}
