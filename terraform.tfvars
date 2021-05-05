number_of_subnets = 4
regions = ["us-west1","us-west2"]
vpc_name = "dev-vpc"
subnet_prefix = "dev-subnet"
subnet_bits = 6
base_cidr = "121.21.1.0/22"
secondary_ip_range = "10.101.8.0/22"
secondary_ip_range_name = "dev-subnet-secondary-ips"
project_id = "kube-demo-march921"


node_pool_name = "dev-gke-node"
gke_cluster_name = "dev-gke-cluster"
cluster_location = "us-west1"