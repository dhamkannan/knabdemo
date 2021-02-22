##################################################################################
# VARIABLES
##################################################################################

variable "region" {
  default = "ap-south-1"
}

variable "key_name" {
}

variable "instance_name" {
}

variable "network_address_space" {
  default = "10.1.0.0/16"
}

variable "subnet1_address_space" {
  default = "10.1.0.0/24"
}

##################################################################################
# LOCALS
##################################################################################

locals {
  project_name = lower(terraform.workspace)
}