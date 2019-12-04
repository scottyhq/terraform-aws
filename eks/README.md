# set up required infrastructure for deploying jupyterhub on eks

eksctl simplifies cluster creation and management, but doesn't do it all:

1) Need an iam user with cluster management permissions
2) Need an EFS drive for user home directories
3) Need policies giving hub users access to S3 buckets

# Keep an eye on eksctl integration w/ terraform (would enable single script!)
# https://github.com/weaveworks/eksctl/issues/1094

Steps:
1) change terraform.tfvars
2) run `terraform init` followed by `terraform plan`
3) run `terraform apply` to create iam user for cluster managment
4) genereate CLI access keys in aws console and add eksbot profile
5) manually modify eksctl-config.yml
5) create cluster `eksctl --profile eksbot create cluster --config-file=eksctl-config.yml`
6) create an efs drive in same VPC as new EKS cluster
7) deploy jupyterhub to cluster!

