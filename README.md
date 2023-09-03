# gitops-bridge-argocd-metadata-terraform
Terraform module for gitops-bridge argocd metadata

It generates the argocd cluster secret that contains the metadata for argocd application sets

To be use with [gitops-bridge](https://github.com/gitops-bridge-dev/) project, see example [here](https://github.com/gitops-bridge-dev/gitops-bridge/blob/main/argocd/iac/terraform/examples/eks/hello-world/main.tf)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addons"></a> [addons](#input\_addons) | ArgoCD cluster additional addons labels to be extracted by application sets | `map(string)` | `{}` | no |
| <a name="input_argocd"></a> [argocd](#input\_argocd) | Overrides for ArgoCD cluster secret like name, namespace, data server, data config, take a look at main.tf | `map(string)` | `{}` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | ArgoCD cluster name | `string` | `"in-cluster"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ArgoCD cluster label environment | `string` | `"dev"` | no |
| <a name="input_metadata"></a> [metadata](#input\_metadata) | ArgoCD cluster additional metadata annotations to be extracted by application sets | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argocd"></a> [argocd](#output\_argocd) | Argocd cluster secret |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
