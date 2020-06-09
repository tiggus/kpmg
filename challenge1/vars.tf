# variables

# local vars
locals {
  location   = "westeurope"
  resourcegroup = "kpmg"
}

variable "tiers" {
  description = "tiers"
  type        = list(string)
  default     = ["web", "app", "db"]
}