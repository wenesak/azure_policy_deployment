data "azurerm_subscription" "current" {}


locals {
  policy_files = fileset(var.policy_folder, "*.json")

  policy_files_without_extension = [ for p in local.policy_files: split(".", p)[0] ]

  policy_json = {
    for policy in local.policy_files_without_extension:
        policy => jsondecode(file(join("", [var.policy_folder, policy, ".json"])))
  }
}
