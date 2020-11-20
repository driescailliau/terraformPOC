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
  default  = ["eastus", "nordeurope", "uksouth"] 
}