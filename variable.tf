//VPC
variable "cidr_block" {
    default = "10.0.0.0/16"
}
variable "instance_tenancy" {
    default = "default"
}

//Subnet
variable "public_cidr_block" {
    default = "10.0.1.0/24"
  
}
variable "private_cidr_block" {
    default = "10.0.2.0/24"
}