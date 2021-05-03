variable "vpc_name" {
  description = "Name of the vpc"
}

variable "number_of_subnets" {
  description = "Number of subnets in the vpc"
}

variable "subnet_prefix" { }

variable "subnet_bits" { }

variable "regions" { }

variable "base_cidr" { }

variable "secondary_ip_range" { }

variable "secondary_ip_range_name" { }