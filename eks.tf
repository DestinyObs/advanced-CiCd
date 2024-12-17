# resource "aws_eks_cluster" "eks" {
#   name     = var.eks_cluster_name
#   role_arn = aws_iam_role.eks_role.arn

#   vpc_config {
#     subnet_ids         = aws_subnet.main[*].id
#     security_group_ids = [aws_security_group.eks_sg.id]
#   }

#   depends_on = [aws_vpc.main, aws_subnet.main]
# }

# resource "aws_iam_role" "eks_role" {
#   name = "eks_role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Service = "eks.amazonaws.com"
#         }
#         Action  = "sts:AssumeRole"
#       },
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
#   role       = aws_iam_role.eks_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
# }
