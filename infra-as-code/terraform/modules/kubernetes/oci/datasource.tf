data "oci_containerengine_cluster_kube_config" "oke_kube_config" {
  cluster_id = module.oke.cluster_id
}
