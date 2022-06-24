resource "aws_eks_cluster" "eks-cluster" {
  name     = "eks-cluster"
  role_arn = var.arn_role

  vpc_config {
    subnet_ids = [ aws_subnet.eks-subnet1.id, aws_subnet.eks-subnet2.id ]
    security_group_ids = [ aws_security_group.eks_sg.id ]
  }
  
}

resource "aws_eks_node_group" "node-ec2"{
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_role_arn   = var.arn_role
  node_group_name = "t3_large_node"
  subnet_ids      = [ aws_subnet.eks-subnet1.id, aws_subnet.eks-subnet2.id ]
  
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  ami_type       = "AL2_x86_64"
  instance_types = ["t3.large"]
  capacity_type  = "ON_DEMAND"
  disk_size      = 20

}
