variable "create" {
  description = "Controls if terraform resources should be created (it affects almost all resources)"
  default     = true
}

variable "environment" {
  description = "The nick name identifying the type of environment (i.e. test, staging, production)"
}

variable "location" {
  description = "The data center location where all resources will be put into."
}

variable "resource_name_prefix" {
  description = "The prefix used to name all resources created."
}

locals {
  # Define resource names based on the following convention:
  # {azurerm_resource_name_prefix}-RESOURCE_TYPE-{environment}
  azurerm_apim_name = "${var.resource_name_prefix}-apim-${var.environment}"
  azurerm_apim_scmurl = "https://${var.resource_name_prefix}-apim-${var.environment}.scm.azure-api.net/"
}

# TF_VAR_ADB2C_TENANT_ID
variable "ADB2C_TENANT_ID" {
  type        = "string"
  description = "Name of the Active Directory B2C tenant used in the API management portal authentication flow"
  default     = "agidweb"
}

# TODO: needs refactoring
variable "apim_configuration_path" {
  default     = "common/apim.json"
  description = "Path of the (json) file that contains the configuration settings for the API management resource"
}

variable "notification_sender_email" {
  type        = "string"
  description = "Email address from which the notification will be sent."
}

variable "resource_group_name" {
  type        = "string"
  description = "Resource group name"
}

variable "publisher_email" {
  type        = "string"
  description = "Publisher email address"
}

variable "publisher_name" {
  type        = "string"
  description = "Publisher name"
}

variable "sku_name" {
  type        = "string"
  description = "Stock Keeping Unit Name"
  default     = "Consumption"
}

variable "sku_capacity" {
  description = "Stock Keeping Unit Capacity"
  default     = 1
}

variable "key_vault_id" {
  description = "Key Vauld id"
}

variable "azurerm_function_app_name" {
  description = "Function app name"
  default     = "undefined"
}

variable "virtualNetworkType" {
  description = "The type of VPN in which API Management service needs to be configured in. None (Default Value) means the API Management service is not part of any Virtual Network, External means the API Management deployment is set up inside a Virtual Network having an Internet Facing Endpoint, and Internal means that API Management deployment is setup inside a Virtual Network having an Intranet Facing Endpoint only."
  default     = "external"
}

variable "virtualNetworkConfiguration" {
  description = "Configuration of a virtual network to which API Management service is deployed."
  type        = "map"
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = "map"

  default = {}
}

variable "identity" {
  description = "Managed service identity of the Api Management service."
  type        = "map"

  default = {}
}

variable "customProperties" {
  description = "Custom properties of the API Management service. Setting Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Ciphers.TripleDes168 will disable the cipher TLS_RSA_WITH_3DES_EDE_CBC_SHA for all TLS(1.0, 1.1 and 1.2). Setting Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls11 can be used to disable just TLS 1.1 and setting Microsoft.WindowsAzure.ApiManagement.Gateway.Security.Protocols.Tls10 can be used to disable TLS 1.0 on an API Management service."
  type        = "map"

  default = {}
}

variable "provisioner_version" {
  description = "Force re-provisioning of API Management Git configuration"
  default     = "1"
}

variable "apim_provisioner" {
  default = "local-provisioners/azurerm_apim.ts"
}

