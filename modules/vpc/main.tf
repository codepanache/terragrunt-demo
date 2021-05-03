resource "google_compute_subnetwork" "vpc_subnet" {
    for_each =  {for idx,zone in var.regions: zone => idx}
    name          = format("%s-%s",var.subnet_prefix,each.key)
    ip_cidr_range = cidrsubnet(var.base_cidr,var.subnet_bits,each.value)
    region        = each.key
    network       = google_compute_network.vpc_network.id
  secondary_ip_range {
    range_name    = var.secondary_ip_range_name
    ip_cidr_range = cidrsubnet(var.secondary_ip_range,var.subnet_bits,each.value)
  }
}

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}