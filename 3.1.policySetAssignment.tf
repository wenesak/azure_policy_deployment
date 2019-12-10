# for sandpit
resource "azurerm_policy_assignment" "policy_assignment" {
  name    = join("", [var.name_space, "_PA"])
  scope   = data.azurerm_subscription.current.id

  policy_definition_id = azurerm_policy_set_definition.policy_set.id
  description          = join("", [var.name_space, ": policy assignment"])
  display_name         = join("", [var.name_space, "_PA"])
  location             = var.location

  identity {
    type = "SystemAssigned"
  }
}
