output "tfstate_rg_name" {
  description = "The name of the resource group for the remote state."
  value       = var.tfstate_rg_name
}

output "storage_account_name" {
  description = "The name of the storage account for the remote state."
  value       = var.storage_account_name
}

output "container_name" {
  description = "The name of the container for the remote state."
  value       = var.container_name
}
