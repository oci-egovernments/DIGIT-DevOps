module "oke" {
  source                       = "oracle-terraform-modules/oke/oci"
  version                      = "5.1.0"
  compartment_id               = var.compartment_id
  worker_compartment_id        = var.compartment_id
  home_region                  = local.home_region
  region                       = var.region
  create_vcn                   = var.create_vcn
  vcn_id                       = var.vcn_id
  subnets                      = local.oke_subnets
  cni_type                     = var.cni_type
  cluster_name                 = var.cluster_name
  create_cluster               = true
  kubernetes_version           = var.kubernetes_version
  create_bastion               = false
  create_operator              = false
#  allow_bastion_cluster_access = true
  allow_pod_internet_access    = true
  control_plane_is_public      = true
  control_plane_allowed_cidrs  = var.cp_allowed_cidrs
  load_balancers               = "both"
  preferred_load_balancer      = "public"  
  worker_image_os_version      = var.worker_image_os_version
  worker_shape                 = local.worker_shape_properties
  worker_pools                 = local.worker_pools
  cluster_type                 = var.core_cluster_type
  allow_worker_ssh_access      = true
  allow_rules_public_lb        = var.core_oke_allow_rules_public_lb
  
  providers = {
    oci      = oci.current_region
    oci.home = oci.home
  }


}


locals {
  oke_subnets = {
    "pub_lb" = {
      "create" = "never"
      "id"     = var.lb_subnet_id
    },
    "cp" = {
      "create" = "never"
      "id"     = var.endpoint_subnet_id
    },
    "pods" = {
      "create" = "never"
      "id"     = var.worker_subnet_id
    },
    "workers" = {
      "create" = "never"
      "id"     = var.pod_subnet_id
    }
  }

}


locals {

  worker_pools = {
    np2 = {
      mode   = "node-pool",
      size   = 1,
      shape  = "VM.Standard.E4.Flex",
      create = true
    }
  }

  home_region      = lookup(data.oci_identity_regions.home_region.regions[0], "name")
}

locals {
  worker_shape_properties = {
    shape            = var.worker_shape
    ocpus            = var.worker_ocpu
    memory           = var.worker_memory
    boot_volume_size = var.worker_boot_volume_size
  }
}