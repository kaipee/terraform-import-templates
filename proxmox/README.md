# Terraform import template for Proxmox provider by Telmate
A collection of templates, including all options available, for importing a Proxmox resources into terraform.

https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/

## Permissions

The following permissions are required to create, configure and destroy machines.

1. Datastore.AllocateSpace
1. Datastore.Audit
1. Pool.Allocate
1. Sys.Console
1. VM.Allocate
1. VM.Audit
1. VM.Clone
1. VM.Config.CDROM
1. VM.Config.CPU
1. VM.Config.Cloudinit
1. VM.Config.Disk
1. VM.Config.HWType
1. VM.Config.Memory
1. VM.Config.Network
1. VM.Config.Options
1. VM.Monitor
1. VM.PowerMgmt
