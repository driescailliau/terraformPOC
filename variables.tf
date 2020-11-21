variable "client_secret" {
    description = "Secret to Connect Azure subscription"
}

variable "subscription_id" {
    description = "Azure subscription"
}

variable "tenant_id" {
    description = "Azure tenant"
}

variable "client_id" {
    description = "Azure SPN client id"
}

variable "loc" {
    description = "Default Azure region"
    default     = "westeurope"
}

variable "tags" {
    default     = {
        source  = "cadri"
        env     = "training"
    }
}

variable "webapplocs" {
  default  = ["eastus", "northeurope", "uksouth"] 
}