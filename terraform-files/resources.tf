##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  region = var.region
}


# Create VPC, Subget, RT, IGW
module "network-components" {
  source                  = "./Modules/Network"
  network_address_space   = var.network_address_space
  subnet1_address_space   = var.subnet1_address_space
  prefix                  = local.project_name
}



# Create Nginx instance#
module "nginx-instance" {
  source        = "./Modules/EC2"
  key_name      = var.key_name
  instance_name = var.instance_name
  subnet_id     = module.network-components.subnet1.id
  vpc_id        = module.network-components.vpc.id
  prefix        = local.project_name
}


##################################################################################
# OUTPUT
##################################################################################

output "aws_instance_public_dns" {
  value = module.nginx-instance.aws_instance_public_dns
}
