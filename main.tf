
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.prefix}-rg"
  location = "East US 2"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "${var.prefix}-appserviceplan"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "BasicV1"
    size = "B1"
  }
}
resource "azurerm_app_service" "docker_app" {
  name                = "${var.prefix}-App"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id 
}

 




