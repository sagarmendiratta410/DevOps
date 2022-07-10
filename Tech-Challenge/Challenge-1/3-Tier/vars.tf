variable "engine" {}
variable "engine_version" {}     
variable "instance_class" {}
variable "name"  {}       
 
variable "username" {
  description = "Username for the master DB user."
  type        = string
}

variable "region" {}
variable "main_vpc_cidr" {}
variable "public_subnets" {}
variable "private_subnets" {}

