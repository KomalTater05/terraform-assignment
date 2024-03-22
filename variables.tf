variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = map
  default     = {
    "default"     = "10.0.0.0/16"
    "qa"      = "10.1.0.0/16"
  }
}

variable "subnet1_cidr_block" {
  description = "CIDR block for subnet 1"
  type        = map
  default     = {
     "default"     = "10.0.1.0/24"
     "qa"      = "10.1.1.0/24"
  }
}

variable "subnet2_cidr_block" {
  description = "CIDR block for subnet 2"
  type        = map
  default     ={
     "default"     = "10.0.2.0/24"
     "qa"      = "10.1.2.0/24"
  }
}

variable "subnet1_availability_zone" {
  description = "Availability zone for subnet 1"
  default     = "ap-south-1a"
}

variable "subnet2_availability_zone" {
  description = "Availability zone for subnet 2"
  default     = "ap-south-1b"
}

variable "cluster_name"{
  description = "Name of the cluster"
  default     = {
    "default"     = "my-cluster-k-dev"
    "qa"      = "my-cluster-k-qa"
  }
}