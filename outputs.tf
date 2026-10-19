output "isolated_vpc_id" {
  value       = module.network.vpc_id
  description = "The tracking hash reference of the created isolation network infrastructure."
}

output "compute_target_public_ip" {
  value       = module.compute.public_ip
  description = "The ephemeral public IPv4 interface for application endpoint validation."
}

output "secure_storage_bucket_domain" {
  value       = module.compute.bucket_domain_name
  description = "The fully qualified absolute DNS name for secure cloud storage object delivery."
}
