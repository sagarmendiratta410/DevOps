module "Infra" {
  source = "./Infra"
  main_vpc_cidr       = var.main_vpc_cidr             
  public_subnets      = var.public_subnets
  private_subnets  = var.private_subnets
  region = "us-east-1"
}

module "EC2" {
  source = "./EC2"

}


module "Database" {
  source = "./Database"
  engine             = var.engine
  engine_version     = var.engine_version
  instance_class     = var.instance_class
  name               = var.name
  username           = var.username
}