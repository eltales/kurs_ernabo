variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "app_name" {
  type        = string
  description = "Baza nazwy aplikacji; finalnie będzie z suffixem dla unikalności."
}

variable "plan_sku_name" {
  type    = string
  default = "B1"
}

variable "docker_image" {
  type        = string
  description = "np. realeltales/lekcja1"
}

variable "docker_tag" {
  type        = string
  description = "np. 20260128-1905"
}

variable "docker_registry_url" {
  type        = string
  description = "Jawnie ustawione (Docker Hub = https://docker.io). Pomaga uniknąć problemów z referencją obrazu."
  default     = "https://docker.io"
}

variable "container_port" {
  type    = number
  default = 80
}

# Ustaw na true, jeśli obraz jest prywatny (wtedy potrzebujesz user/pass dla registry)
variable "use_docker_registry_auth" {
  type    = bool
  default = false
}

variable "docker_registry_username" {
  type    = string
  default = ""
}

variable "docker_registry_password" {
  type      = string
  default   = ""
  sensitive = true
}

variable "tags" {
  type    = map(string)
  default = {}
}