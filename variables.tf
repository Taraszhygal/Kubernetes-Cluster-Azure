variable "prefix" {
  default = "nginx-test"
}
variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "West Europe"
}

variable "appId" {
  description = "Azure Kubernetes Service Cluster service principal"
}

variable "password" {
  description = "Azure Kubernetes Service Cluster password"
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}