resource "aws_eks_cluster" "ekstf" {
  name     = var.cluster-name
  role_arn = aws_iam_role.ekstf-cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.ekstf-cluster.id]
    subnet_ids = module.vpc.public_subnets
  }

  depends_on = [
    aws_iam_role_policy_attachment.ekstf-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.ekstf-cluster-AmazonEKSServicePolicy,
  ]
}
