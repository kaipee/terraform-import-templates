# Terraform import template for Proxmox provider by Telmate
A collection of templates, including all options available, for importing a Proxmox resources into terraform.

https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/

## Permissions

The following permissions are required to create, configure and destroy machines.

```
Datastore.AllocateSpace
Datastore.Audit
Pool.Allocate
Sys.Console
VM.Allocate
VM.Audit
VM.Clone
VM.Config.CDROM
VM.Config.CPU
VM.Config.Cloudinit
VM.Config.Disk
VM.Config.HWType
VM.Config.Memory
VM.Config.Network
VM.Config.Options
VM.Monitor
VM.PowerMgmt
```
