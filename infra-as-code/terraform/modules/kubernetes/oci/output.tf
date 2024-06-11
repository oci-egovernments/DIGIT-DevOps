output "kubeconfig" {
  value = data.oci_containerengine_cluster_kube_config.oke_kube_config.content
}