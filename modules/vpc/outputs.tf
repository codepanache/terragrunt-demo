output "vpc-id" {
    value = google_compute_network.vpc_network.id
}

output "subnet-id" {
    value = tomap({for k,v in google_compute_subnetwork.vpc_subnet : k => v.id})
}