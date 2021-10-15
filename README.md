# Terraform Import Templates
A collection of templates, including all options available, for importing resources into terraform using a number of providers.

Current version of Terraform do not automatically query and retrieve all information about resources for remote infrastructure that has been created outside of Terraform.

When importing existing remote resources into Terraform, the resource data must be manually defined before running `terraform import`.
