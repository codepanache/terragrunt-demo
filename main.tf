provider "google" {
  project    = var.project_id
}
# create the VPC
module "vpc"{
  source = "./modules/vpc"
  vpc_name = var.vpc-name
  base_cidr = var.base-cidr
  regions = var.regions
  number_of_subnets = var.number-of-subnets
  subnet_bits = var.subnet-bits
  subnet_prefix = var.subnet-prefix
  secondary_ip_range = var.secondary-ip-range
  secondary_ip_range_name = var.secondary-ip-range-name
}

