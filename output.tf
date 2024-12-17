output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

#output "eks_cluster_endpoint" {
#  description = "The endpoint for the EKS cluster"
#  value       = aws_eks_cluster.eks.endpoint
#}

#output "eks_cluster_security_group_id" {
#  description = "The security group ID of the EKS cluster"
#  value       = tolist(aws_eks_cluster.eks.vpc_config[0].security_group_ids)[0]
#}

output "jenkins_master_public_ip" {
  description = "Public IP of the Jenkins Master instance"
  value       = aws_instance.jenkins_master.public_ip
}

output "jenkins_agent_public_ip" {
  description = "Public IP of the Jenkins Agent instance"
  value       = aws_instance.jenkins_agent.public_ip
}
