variable "location" {
  type = string
}

variable "tfstate_rg_name" {
  type = string
}

variable "storage_account_name" {
  type        = string
  description = "Musi być globalnie unikalna, 3-24 znaki, tylko małe litery i cyfry."
}

variable "container_name" {
  type    = string
  default = "tfstate"
}

variable "tags" {
  type    = map(string)
  default = {}
}