resource "proxmox_vm_qemu" "name" {

  // REQUIRED
  name        = "" # (required) The name of the VM within Proxmox.
  target_node = "" # (required) A string containing the cluster node name.

  // OPTIONAL
  vmid                   = 0                  # The ID of the VM in Proxmox. The default value of 0 indicates it should use the next available ID in the sequence.
  desc                   = ""                 # The description of the VM. Shows as the 'Notes' field in the Proxmox GUI.
  define_connection_info = false               # Whether to let terraform define the (SSH) connection parameters for preprovisioners, see config block below.
  bios                   = "seabios"          # The BIOS to use, options are seabios or ovmf for UEFI.
  onboot                 = true               # Whether to have the VM startup after the PVE node starts.
  boot                   = "cdn"              # The boot order for the VM. Ordered string of characters denoting boot order. Options: floppy (a), hard disk (c), CD-ROM (d), or network (n).
  bootdisk               = ""                 # Enable booting from specified disk. You shouldn't need to change it under most circumstances.
  agent                  = 1                  # Set to 1 to enable the QEMU Guest Agent. Note, you must run the qemu-guest-agent daemon in the quest for this to have any effect.
  #iso                    = ""                 # The name of the ISO image to mount to the VM. Only applies when clone is not set. Either clone or iso needs to be set.
  clone                  = ""                 # The base VM from which to clone to create the new VM.
  full_clone             = true               # Set to true to create a full clone, or false to create a linked clone. See the docs about cloning for more info. Only applies when clone is set.
  hastate                = "ignored"                 # Requested HA state for the resource. One of "started", "stopped", "enabled", "disabled", or "ignored". See the docs about HA for more info.
  qemu_os                = "l26"              # The type of OS in the guest. Set properly to allow Proxmox to enable optimizations for the appropriate guest OS.
  memory                 = 512                # The amount of memory to allocate to the VM in Megabytes.
  balloon                = 1                  # The minimum amount of memory to allocate to the VM in Megabytes, when Automatic Memory Allocation is desired. Proxmox will enable a balloon device on the guest to manage dynamic allocation. See the docs about memory for more info.
  sockets                = 1                  # The number of CPU sockets to allocate to the VM.
  cores                  = 1                  # The number of CPU cores per CPU socket to allocate to the VM.
  vcpus                  = 0                  # The number of vCPUs plugged into the VM when it starts. If 0, this is set automatically by Proxmox to sockets * cores.
  cpu                    = "host"             # The type of CPU to emulate in the Guest. See the docs about CPU Types for more info.
  numa                   = false              # Whether to enable Non-Uniform Memory Access in the guest.
  hotplug                = "network,disk,usb" # Comma delimited list of hotplug features to enable. Options: network, disk, cpu, memory, usb. Set to 0 to disable hotplug.
  scsihw                 = "virtio-scsi-single"              # The SCSI controller to emulate. Options: lsi, lsi53c810, megasas, pvscsi, virtio-scsi-pci, virtio-scsi-single.
  pool                   = ""                 # The resource pool to which the VM will be added.
  tags                   = ""                 # Tags of the VM. This is only meta information.
  force_create           = true              # If false, and a vm of the same name, on the same node exists, terraform will attempt to reconfigure that VM with these settings. Set to true to always create a new VM (note, the name of the VM must still be unique, otherwise an error will be produced.)
  clone_wait             = 5                 # Provider will wait clone_wait seconds after an UpdateConfig operation.
  additional_wait        = 5                 # The amount of time in seconds to wait between creating the VM and powering it up.
  #preprovision                = true               # Whether to preprovision the VM. See Preprovision above for more info.
  os_type                     = "cloud-init" # Which provisioning method to use, based on the OS type. Options: ubuntu, centos, cloud-init.
  force_recreate_on_change_of = "" # If the value of this string changes, the VM will be recreated. Useful for allowing this resource to be recreated when arbitrary attributes change. An example where this is useful is a cloudinit configuration (as the cicustom attribute points to a file not the content).
  #os_network_config           = ""                 # Only applies when define_connection_info is true. Network configuration to be copied into the VM when preprovisioning ubuntu or centos guests. The specified configuration is added to /etc/network/interfaces for Ubuntu, or /etc/sysconfig/network-scripts/ifcfg-eth0 for CentOS. Forces re-creation on change.
  #ssh_forward_ip              = ""                 # Only applies when define_connection_info is true. The IP (and optional colon separated port), to use to connect to the host for preprovisioning. If using cloud-init, this can be left blank.
  #ssh_user                    = ""                 # Only applies when define_connection_info is true. The user with which to connect to the guest for preprovisioning. Forces re-creation on change.
  #ssh_private_key             = ""                 # Only applies when define_connection_info is true. The private key to use when connecting to the guest for preprovisioning. Sensitive.
  ci_wait                 = 5 # How to long in seconds to wait for before provisioning.
  ciuser                  = "terraform" # Override the default cloud-init user for provisioning.
  cipassword              = "${var.cipassword}" # Override the default cloud-init user's password. Sensitive.
  cicustom                = "" # Instead specifying ciuser, cipasword, etc… you can specify the path to a custom cloud-init config file here. Grants more flexibility in configuring cloud-init.
  cloudinit_cdrom_storage = "" # Set the storage location for the cloud-init drive. Required when specifying cicustom.
  searchdomain            = "" # Sets default DNS search domain suffix.
  nameserver              = "" # Sets default DNS server for guest.
  sshkeys                 = "${var.ci_sshkeys}" # Newline delimited list of SSH public keys to add to authorized keys file for the cloud-init user.
  ipconfig0               = "" # The first IP address to assign to the guest. Format: [gw=<GatewayIPv4>] [,gw6=<GatewayIPv6>] [,ip=<IPv4Format/CIDR>] [,ip6=<IPv6Format/CIDR>].
  ipconfig1               = "" # The second IP address to assign to the guest. Same format as ipconfig0.
  ipconfig2               = "" # The third IP address to assign to the guest. Same format as ipconfig0.
  ipconfig3               = "" # The fourth IP address to assign to the guest. Same format as ipconfig0.
  ipconfig4               = "" # The fifth IP address to assign to the guest. Same format as ipconfig0.
  ipconfig5               = "" # The sixth IP address to assign to the guest. Same format as ipconfig0.

  vga {          # The vga block is used to configure the display device. It may be specified multiple times, however only the first instance of the block will be used.
    type = "std" # The type of display to virtualize. Options: cirrus, none, qxl, qxl2, qxl3, qxl4, serial0, serial1, serial2, serial3, std, virtio, vmware.
    // !DISABLED AS TERRAFORM DOES NOT VALIDATE! type = 0     # Sets the VGA memory (in MiB). Has no effect with serial display type.
  }

  network {           # The network block is used to configure the network devices. It may be specified multiple times. The order in which the blocks are specified determines the ID for each net device. i.e. The first network block will become net0, the second will be net1 etc
    model     = "virtio"    # (required) Network Card Model. The virtio model provides the best performance with very low CPU overhead. If your guest does not support this driver, it is usually best to use e1000
    macaddr   = ""    # Override the randomly generated MAC Address for the VM.
    bridge    = "vmbr0" # Bridge to which the network device should be attached. The Proxmox VE standard bridge is called vmbr0.
    tag       = -1    # The VLAN tag to apply to packets on this device. -1 disables VLAN tagging.
    firewall  = false # Whether to enable the Proxmox firewall on this network device.
    rate      = 0     # Network device rate limit in mbps (megabytes per second) as floating point number. Set to 0 to disable rate limiting.
    queues    = 0     # Number of packet queues to be used on the device. Requires virtio model to have an effect.
    link_down = false # Whether this interface should be disconnected (like pulling the plug).
  }

  disk {
    type        = "scsi"       # (required) The type of disk device to add. Options: ide, sata, scsi, virtio.
    storage     = "local-lvm"       # (required) The name of the storage pool on which to store the disk.
    size        = "8G"     # (required) The size of the created disk, format must match the regex \d+[GMK], where G, M, and K represent Gigabytes, Megabytes, and Kilobytes respectively.
    format      = "raw"    # The drive’s backing file’s data format.
    cache       = "none"   # The drive’s cache mode. Options: directsync, none, unsafe, writeback, writethrough
    backup      = 1        # Whether the drive should be included when making backups.
    iothread    = 1        # Whether to use iothreads for this drive. Only effective with a disk of type virtio, or scsi when the the emulated controller type (scsihw top level block argument) is virtio-scsi-single.
    replicate   = 0        # Whether the drive should considered for replication jobs.
    ssd         = 1        # Whether to expose this drive as an SSD, rather than a rotational hard disk.
    discard     = "ignore" # Controls whether to pass discard/trim requests to the underlying storage. Only effective when the underlying storage supports thin provisioning. There are other caveots too, see the docs about disks for more info.
    mbps        = 0        # Maximum r/w speed in megabytes per second. 0 means unlimited.
    mbps_rd     = 0        # Maximum read speed in megabytes per second. 0 means unlimited.
    mbps_rd_max = 0        # Maximum read speed in megabytes per second. 0 means unlimited.
    mbps_wr     = 0        # Maximum write speed in megabytes per second. 0 means unlimited.
    mbps_wr_max = 0        # Maximum unthrottled write pool in megabytes per second. 0 means unlimited.
    file        = ""       # The filename portion of the path to the drive’s backing volume. You shouldn't need to specify this, use the storage parameter instead.
    # !BROKEN! media       = "disk"   # The drive’s media type. Options: cdrom, disk.
    volume      = ""       # The full path to the drive’s backing volume including the storage pool name. You shouldn't need to specify this, use the storage parameter instead.
    #storage_type = ""     # The type of pool that storage is backed by. You shouldn't need to specify this, use the storage parameter instead.
  }
}
