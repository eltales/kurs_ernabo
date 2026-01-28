output "app_name" {
  value = azurerm_linux_web_app.web.name
}

output "default_hostname" {
  value = azurerm_linux_web_app.web.default_hostname
}

output "url" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}