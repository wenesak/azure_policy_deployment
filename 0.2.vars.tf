variable "location" {
  default = "Australia Southeast"
}

variable "tags" {
  type = map
  default = {
    Environment   = "nonprod"
  }
}

variable "name_space" {
  default = "p_test"
}

variable "assign_policy_to_subscription" {
  default = "true"
}

variable "environment" {
  type        = string
  default     = "sandpit"
}

variable "policy_folder" {
  type        = string
  default     = "./policies/"
}
