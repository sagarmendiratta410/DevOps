resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}
 
resource "aws_secretsmanager_secret" "secretmasterDB" {
   name = "Masteraccoundb2"
}
 
resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id = aws_secretsmanager_secret.secretmasterDB.id
  secret_string = <<EOF
   {
    "username": "adminaccount",
    "password": "${random_password.password.result}"
   }
EOF
}
 

data "aws_secretsmanager_secret" "secretmasterDB" {
  arn = aws_secretsmanager_secret.secretmasterDB.arn
}
 
 
data "aws_secretsmanager_secret_version" "creds" {
  secret_id = data.aws_secretsmanager_secret.secretmasterDB.arn
}
 
 
locals {
  db_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}


resource "aws_db_instance" "default" {
  allocated_storage  = 10
  engine             = var.engine
  engine_version     = var.engine_version
  instance_class     = var.instance_class
  name               = var.name
  username           = var.username
  password           = local.db_creds.password

}


