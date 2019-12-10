resource "azurerm_policy_definition" "policy" {
  for_each = local.policy_json
  
  name = join("", [var.name_space, "_", each.value.name])
  display_name = join("", [var.name_space, "_", each.value.properties.displayName])
  policy_type  = each.value.properties.policyType
  mode         = each.value.properties.mode
  metadata     = jsonencode(each.value.properties.metadata)
  policy_rule  = jsonencode(each.value.properties.policyRule)
  parameters   = jsonencode(each.value.properties.parameters)
  
  lifecycle {
    ignore_changes = [
      metadata
    ]
  }
}
