output "public_ip" {
  value       = aws_instance.app_server.public_ip
  description = "Public IP associated with the host compute unit."
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.secure_assets.bucket_regional_domain_name
  description = "FQDN for regional cloud bucket secure transactions."
}
