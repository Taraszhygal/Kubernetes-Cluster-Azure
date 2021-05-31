resource "azurerm_resource_group" "k8s" {
    name     = "${var.prefix}-k8s-resources"
    location = var.location
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "${var.prefix}-k8s"
  location            = azurerm_resource_group.k8s.location
  resource_group_name = azurerm_resource_group.k8s.name
  dns_prefix          = "${var.prefix}-k8s"

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
      }
  }

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control {
    enabled = true
  }

  # addon_profile {
  #   kube_dashboard {
  #     enabled = true
  #   }
  # }

  tags = {
    environment = "Dev"
  }
}