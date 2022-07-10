

output "secret_id" {
  value = aws_secretsmanager_secret.secretmasterDB.id
}
output "secret_arn" {
  value = aws_secretsmanager_secret.secretmasterDB.arn
}


