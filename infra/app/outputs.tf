output "app_name" {
  value = azurerm_linux_web_app.app.name
}

output "default_hostname" {
  value = azurerm_linux_web_app.app.default_hostname
}

output "url" {
  value = "https://${azurerm_linux_web_app.app.default_hostname}"
}