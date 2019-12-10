resource "azurerm_policy_set_definition" "policy_set" {
  name         = join("", [var.name_space, "_PolicySet"])
  display_name = join("", [var.name_space, ": Policy Set"])
  policy_type  = "Custom"

  lifecycle {
    ignore_changes = [
      metadata
    ]
  }

  policy_definitions = jsonencode([ for p in local.policy_files_without_extension: {"policyDefinitionId": azurerm_policy_definition.policy[p].id }])
}
