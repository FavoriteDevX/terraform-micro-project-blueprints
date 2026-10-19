terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source      = "./modules/network"
  aws_region  = var.aws_region
  vpc_cidr    = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

module "compute" {
  source        = "./modules/compute"
  vpc_id        = module.network.vpc_id
  subnet_id     = module.network.subnet_id
  ami_id        = var.ubuntu_ami_id
  unique_suffix = var.project_suffix
}
