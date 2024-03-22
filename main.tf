
module "vpc_module" {
  source = "./vpc"

  vpc_cidr_block            = var.vpc_cidr_block
  subnet1_cidr_block        = var.subnet1_cidr_block
  subnet2_cidr_block        = var.subnet2_cidr_block
  subnet1_availability_zone = var.subnet1_availability_zone
  subnet2_availability_zone = var.subnet2_availability_zone
}

# Define IAM role for QA workspace
resource "aws_iam_role" "eks_qa_role" {
  count              = terraform.workspace == "qa" ? 1 : 0
  name               = "eks-qa-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "eks.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }]
  })
  lifecycle {
    prevent_destroy = true  # Prevents the role from being destroyed when not needed
  }
}

# Attach policy to the QA IAM role
resource "aws_iam_role_policy_attachment" "eks_qa_policy_attachment" {
  count      = terraform.workspace == "qa" ? 1 : 0
  role       = aws_iam_role.eks_qa_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  lifecycle {
    prevent_destroy = true  # Prevents the role from being destroyed when not needed
  }
}

# Define IAM role for default workspace
resource "aws_iam_role" "eks_default_role" {
  count              = terraform.workspace != "qa" ? 1 : 0
  name               = "eks-default-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "eks.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }]
  })
  lifecycle {
    prevent_destroy = true  # Prevents the role from being destroyed when not needed
  }
}

# Attach policy to the default IAM role
resource "aws_iam_role_policy_attachment" "eks_default_policy_attachment" {
  count      = terraform.workspace != "qa" ? 1 : 0
  role       = aws_iam_role.eks_default_role[0].name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  lifecycle {
    prevent_destroy = true  # Prevents the role from being destroyed when not needed
  }
}




resource "aws_eks_cluster" "my_cluster_komal" {
  name     = lookup(var.cluster_name, terraform.workspace)

 role_arn = terraform.workspace == "qa" ? aws_iam_role.eks_qa_role[0].arn : aws_iam_role.eks_default_role[0].arn


  vpc_config {
    subnet_ids = [module.vpc_module.subnet1_id, module.vpc_module.subnet2_id]
  }
}

output "eks_cluster_name" {
  value = aws_eks_cluster.my_cluster_komal.name
}





