output "vpc-id" {
    value = google_compute_network.vpc_network.id
}

output "subnet-id"{
    value = tolist(toset([for field in google_compute_subnetwork.vpc_subnet : field.id]))
}