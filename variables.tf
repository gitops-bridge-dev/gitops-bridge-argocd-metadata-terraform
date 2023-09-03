variable "cluster_name" {
  description = "ArgoCD cluster name"
  type        = string
  default     = "in-cluster"
}
variable "environment" {
  description = "ArgoCD cluster label environment"
  type        = string
  default     = "dev"
}
variable "metadata" {
  description = "ArgoCD cluster additional metadata annotations to be extracted by application sets"
  type        = map(string)
  default     = {}
}
variable "addons" {
  description = "ArgoCD cluster additional addons labels to be extracted by application sets"
  type        = map(string)
  default     = {}
}
variable "argocd" {
  description = "Overrides for ArgoCD cluster secret like name, namespace, data server, data config, take a look at main.tf"
  type        = map(string)
  default     = {}
}
