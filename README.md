# Deprecated
Functionality merged into a single terraform module https://github.com/gitops-bridge-dev/gitops-bridge/pull/28

# gitops-bridge-argocd-metadata-terraform
Terraform module for gitops-bridge argocd metadata

It generates the argocd cluster secret that contains the metadata for argocd application sets

To be use with [gitops-bridge](https://github.com/gitops-bridge-dev/) project, see example [here](https://github.com/gitops-bridge-dev/gitops-bridge/blob/main/argocd/iac/terraform/examples/eks/hello-world/main.tf)

## Usage

```hcl

locals {
  name                   = "ex-${replace(basename(path.cwd), "_", "-")}"
  environment            = "dev"
  cluster_version        = "1.27"
  gitops_addons_url      = "https://github.com/gitops-bridge-devgitops-bridge-argocd-control-plane-template"
  gitops_addons_basepath = ""
  gitops_addons_path     = "bootstrap/control-plane/addons"
  gitops_addons_revision = "HEAD"

  oss_addons = {
    enable_argo_workflows = true
    enable_foo                                   = true # you can add any addon here, make sure to update the gitops repo with the corresponding application set
  }
  addons = merge(local.oss_addons, { kubernetes_version = local.cluster_version })

  addons_metadata = merge(
    {
      addons_repo_url      = local.gitops_addons_url
      addons_repo_basepath = local.gitops_addons_basepath
      addons_repo_path     = local.gitops_addons_path
      addons_repo_revision = local.gitops_addons_revision
    }
  )

  argocd_bootstrap_app_of_apps = {
    addons = file("${path.module}/bootstrap/addons.yaml")
  }

}

############################################################################
# GitOps Bridge: Metadata
############################################################################
module "gitops_bridge_metadata" {
  source = "github.com/gitops-bridge-dev/gitops-bridge-argocd-metadata-terraform?ref=v1.0.0"

  cluster_name = local.name
  environment  = local.environment
  metadata     = local.addons_metadata
  addons       = local.addons
}
```

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
