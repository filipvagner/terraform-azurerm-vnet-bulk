variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = ""
}

variable "vnet_rg" {
  description = "Virtual network resource group"
  type        = string
  default     = ""
}

variable "vnet_location" {
  description = "Virtual network location"
  type        = string
  default     = ""
}

variable "vnet_dns" {
  description = "Virtual network dns addresses, by default Azure-provided"
  type        = list(string)
  default     = []
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = ""
}

variable "subnet_octet" {
  description = "Subnet's octet based on count in root module"
  type        = string
  default     = "0"
}

variable "subnet_address_space" {
  description = "Subnet's address space in virtual network"
  type        = list(string)
  default     = ["0/27", "32/27", "64/27", "96/27", "128/27", "160/27", "192/27", "224/27"]
}

variable "subnet_counter" {
  description = "Counter how many subnets should be created, maximum number is 8"
  type        = number
  default     = 8

  validation {
    condition     = var.subnet_counter <= 8 && var.subnet_counter >= 1
    error_message = "Number of subnets must be less than or eaqual to 8."
  }
}