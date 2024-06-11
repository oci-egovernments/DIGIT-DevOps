#Variables for the provider configuration
variable "tenancy_ocid" {
  type        = string
  description = "The OCID of tenancy"
}

variable "current_user_ocid" {
  type        = string
  description = "The OCID of the user"
}

variable "api_fingerprint" {
  type        = string
  description = "The fingerprint"
}

variable "api_private_key_path" {
  type        = string
  description = "The private key path"
}

variable "region" {
  type        = string
  description = "The OCI region key"
}


variable "worker_image_os_version" {
  description = "The OS version(Oracle Linux) to be used for the worker nodes"
  type        = string
  default     = "7.9"
}

variable "worker_shape" {
  type        = string
  default     = "VM.Standard.E4.Flex"
  description = "Worker node shape for the core OKE cluster"
}

variable "worker_ocpu" {
  type        = string
  default     = "4"
  description = "Worker node OCPU fot the OKE cluster"
}

variable "worker_memory" {
  type        = string
  default     = "32"
  description = "Worker node memory for the OKE cluster"
}

variable "worker_boot_volume_size" {
  type        = string
  default     = "100"
  description = "Worker node boot volume size for the OKE cluster"
}

variable "compartment_id" {
  type        = string
  description = "compartment ocid"
}

variable "tenancy_id" {
  description = "The tenancy id of the OCI Cloud Account in which to create the resources."
  type        = string
}

variable "vcn_id" {
  type        = string
  description = "The OCID of the VCN"
}

variable "create_vcn" {
  type        = boolean
  default     = true
  description = "Flag to indicate whether network components should be created for the OKE cluster"
}

variable "kubernetes_version" {
  description = "version of k8s"
  type        = string
  default     = "v1.28.2"
}

variable "lb_subnet_id" {
  description = "Load balancer subnet OCID "
  type        = string
}

variable "lb_subnet_cidr" {
  description = "Load balancer subnet CIDR "
  type        = string
}

variable "endpoint_subnet_id" {
  description = "Kubernetes endpoint subnet OCID"
  type        = string
}

variable "endpoint_subnet_cidr" {
  description = "Kubernetes endpoint subnet CIDR"
  type        = string
}

variable "worker_subnet_id" {
  description = "Worker nodes subnet OCID"
  type        = string
}

variable "worker_subnet_cidr" {
  description = "Worker nodes subnet CIDR"
  type        = string
}

variable "pod_subnet_id" {
  description = "Pod subnet OCID"
  type        = string
}

variable "pod_subnet_cidr" {
  description = "Pod subnet CIDR"
  type        = string
}

variable "cp_allowed_cidrs" {
  description = "The list of CIDR blocks from which the control plane can be accessed"
  type        = list(string)
}

variable "nodepool_size" {
  description = "Size of the nodepool"
  type        = string
  default     = "1"
}

variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
  default     = "digit-oke-cluster"
}

variable "core_cluster_type" {
  type        = string
  description = "Type of the OKE cluster"
  default     = "enhanced"
}

variable "cni_type" {
  description = "Type of CNI to be used in the OKE cluster. Allowed values are npn/flannel"
  type        = string
  default     = "flannels"
}

variable "core_oke_allow_rules_public_lb" {
  default = {
    "Allow TCP ingress to public load balancers for https traffic from anywhere = " = {
      protocol = 6, port = 443, source = "0.0.0.0/0", source_type = "CIDR_BLOCK",
    },
    "Allow TCP ingress to public load balancers for http traffic from anywhere" = {
      protocol = 6, port = 80, source = "0.0.0.0/0", source_type = "CIDR_BLOCK",
    }
  }
  type = any
}