variable "resource_group_name" {
  description = "Name of the resource group where function app gets created"
  type        = string
}

variable "resource_group_location" {
  description = "Location where the resources will be created"
  type        = string
}


variable "function_app_service_plan_name" {
  description = "Name of the function app service plan"
  type        = string
}

variable "function_app_name" {
  description = "Name of the function app"
  type        = string
}

variable "function_app_service_plan_os" {
  description = "OS for the function app service plan"
  type        = string
}

variable "function_app_service_plan_sku" {
  description = "SKU of the function app service plan"
  type        = string
}

variable "function_app_storage_container_name" {
  description = "Name of the storage container for the function app"
  type        = string
}

variable "function_app_storage_account_name" {
  description = "Name of the function app storage account"
  type        = string
}