output "resource_group_name" {
  value = azurerm_resource_group.k8s.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.example.name
}
