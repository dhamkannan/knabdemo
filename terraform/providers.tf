##################################################################################
# VARIABLES
##################################################################################

variable "region" {
  default = "ap-south-1"
}

##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  region     = var.region
}