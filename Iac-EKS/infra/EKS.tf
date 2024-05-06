module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.24"
  cluster_endpoint_private_access = true
 
  #cluster_addons = {
   # coredns = {
    #  most_recent = true
    #}
    #kube-proxy = {
    #  most_recent = true
    #}
    #vpc-cni = {
    #  most_recent = true
   # }
 # } 

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  #control_plane_subnet_ids = ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]


  # EKS Managed Node Group(s)
  #eks_managed_node_group_defaults = {
  #  instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
 # }

  eks_managed_node_groups = {
    projeto = {
      min_size     = 1
      max_size     = 10
      desired_size = 3
      vpc_security_group_ids = [aws_security_group.ssh_cluster.id]
      instance_types = ["t2.micro"]
      capacity_type  = "SPOT"
    }
  }
}