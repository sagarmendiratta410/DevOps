engine               = "mysql"
engine_version       = "5.7"
instance_class       = "db.t3.micro"
name                 = "mydb"
username             = "user1"
parameter_group_name = "default.mysql5.7"



region = "us-east-1"

main_vpc_cidr       = "10.0.0.0/24"            
public_subnets      = "10.0.0.128/26"
private_subnets     = "10.0.0.192/26"