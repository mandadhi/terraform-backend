
resource "azurerm_resource_group" "rg-name" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "function-app-storage" {
  name                     = var.function_app_storage_account_name
  resource_group_name      = azurerm_resource_group.rg-name.name
  location                 = azurerm_resource_group.rg-name.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "storage-container" {
  name                  = var.function_app_storage_container_name
  container_access_type = "private"
  storage_account_id    = azurerm_storage_account.function-app-storage.id
}

resource "azurerm_service_plan" "function-app-service-plan" {
  name                = var.function_app_service_plan_name
  resource_group_name = azurerm_resource_group.rg-name.name
  location            = azurerm_resource_group.rg-name.location
  sku_name            = var.function_app_service_plan_sku
  os_type             = var.function_app_service_plan_os
}


resource "azurerm_function_app_flex_consumption" "function-app" {
  name                = var.function_app_name
  resource_group_name = azurerm_resource_group.rg-name.name
  location            = azurerm_resource_group.rg-name.location
  service_plan_id     = azurerm_service_plan.function-app-service-plan.id

  storage_container_type      = "blobContainer"
  storage_container_endpoint  = "${azurerm_storage_account.function-app-storage.primary_blob_endpoint}${azurerm_storage_container.storage-container.name}"
  storage_authentication_type = "StorageAccountConnectionString"
  storage_access_key          = azurerm_storage_account.function-app-storage.primary_access_key
  runtime_name                = "dotnet-isolated"
  runtime_version             = "8.0"
  maximum_instance_count      = 50
  instance_memory_in_mb       = 2048

  site_config {}
}