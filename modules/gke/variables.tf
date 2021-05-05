variable "vpc-id" { }

variable "gke_cluster_name" { }

variable "node_pool_name" { }

variable "subnet-id" { 
    type = map
}

variable "cluster_location" { }

variable "project_id" { }

variable "regions" { }