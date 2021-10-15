// Describe an LXC resource to import.
// Until a future terraform release provides automatic resource importing,
// this information MUST be manually copied from the Proxmox instance.
// Defaults have been included.
resource "proxmox_lxc" "some_lxc_resource_name" {

  // REQUIRED
  target_node = "" # (required) A string containing the cluster node name.

  // OPTIONAL
  ostemplate  = ""                       # The volume identifier that points to the OS template or backup file.
  arch        = "amd64"                  # Sets the container OS architecture type. Default is "amd64".
  bwlimit     = 0                        # A number for setting the override I/O bandwidth limit (in KiB/s).
  cmode       = "tty"                    # Configures console mode. "tty" tries to open a connection to one of the available tty devices. "console" tries to attach to /dev/console instead. "shell" simply invokes a shell inside the container (no login). Default is "tty".
  console     = true                     # A boolean to attach a console device to the container. Default is true.
  cores       = 2                        # The number of cores assigned to the container. A container can use all available cores by default.
  cpulimit    = 0                        # A number to limit CPU usage by. Default is 0.
  cpuunits    = 1024                     # A number of the CPU weight that the container possesses. Default is 1024.
  description = "Imported to terraform." # Sets the container description seen in the web interface.

  features = {      # An object for allowing the container to access advanced features.
    fuse    = false # A boolean for enabling FUSE mounts.
    keyctl  = false # A boolean for enabling the keyctl() system call.
    mount   = ""    # Defines the filesystem types (separated by semi-colons) that are allowed to be mounted.
    nesting = false # A boolean to allow nested virtualization.
  }

  force                = false                    # A boolean that allows the overwriting of pre-existing containers.
  hastate              = "stopped"                # Requested HA state for the resource. One of "started", "stopped", "enabled", "disabled", or "ignored". See the docs about HA for more info.
  hookscript           = ""                       # A string containing a volume identifier to a script that will be executed during various steps throughout the container's lifetime. The script must be an executable file.
  hostname             = "some_lxc_resource_name" # Specifies the host name of the container.
  ignore_unpack_errors = false                    # A boolean that determines if template extraction errors are ignored during container creation.
  lock                 = ""                       # A string for locking or unlocking the VM.
  memory               = 1024                     # A number containing the amount of RAM to assign to the container (in MB).

  mountpoint = {      # An object for defining a volume to use as a container mount point. Can be specified multiple times.
    mp        = ""    # (required) The path to the mount point as seen from inside the container. The path must not contain symlinks for security reasons.
    size      = ""    # (required) Size of the underlying volume. Must end in G, M, or K (e.g. "1G", "1024M", "1048576K"). Note that this is a read only value.
    slot      = ""    # (required) A string containing the number that identifies the mount point (i.e. the n in mp[n]).
    key       = 0     # (required) The number that identifies the mount point (i.e. the n in mp[n]).
    storage   = ""    # (required) A string containing the volume, directory, or device to be mounted into the container (at the path specified by mp). E.g. local-lvm, local-zfs, local etc.
    acl       = false # A boolean for enabling ACL support. Default is false.
    backup    = false # A boolean for including the mount point in backups. Default is false.
    quota     = false # A boolean for enabling user quotas inside the container for this mount point. Default is false.
    replicate = false # A boolean for including this volume in a storage replica job. Default is false.
    shared    = false # A boolean for marking the volume as available on all nodes. Default is false.
  }

  nameserver = "" # The DNS server IP address used by the container. If neither nameserver nor searchdomain are specified, the values of the Proxmox host will be used by default.

  network = {          # An object defining a network interface for the container. Can be specified multiple times.
    name     = "eth0"  # (required) The name of the network interface as seen from inside the container (e.g. "eth0").
    bridge   = "vmbr0" # The bridge to attach the network interface to (e.g. "vmbr0").
    firewall = false   # A boolean to enable the firewall on the network interface.
    gw       = ""      # The IPv4 address belonging to the network interface's default gateway.
    gw6      = ""      # The IPv6 address of the network interface's default gateway.
    hwaddr   = ""      # A string to set a common MAC address with the I/G (Individual/Group) bit not set. Automatically determined if not set.
    ip       = "dhcp"  # The IPv4 address of the network interface. Can be a static IPv4 address (in CIDR notation), "dhcp", or "manual".
    ip6      = "auto"  # The IPv6 address of the network interface. Can be a static IPv6 address (in CIDR notation), "auto", "dhcp", or "manual".
    mtu      = ""      # A string to set the MTU on the network interface.
    rate     = -1      # A number that sets rate limiting on the network interface (Mbps).
    tag      = -1      # A number that specifies the VLAN tag of the network interface. Automatically determined if not set.
  }

  onboot     = false      # A boolean that determines if the container will start on boot. Default is false.
  ostype     = ""         # The operating system type, used by LXC to setup and configure the container. Automatically determined if not set.
  password   = "password" # Sets the root password inside the container.
  pool       = ""         # The name of the Proxmox resource pool to add this container to.
  protection = false      # A boolean that enables the protection flag on this container. Stops the container and its disk from being removed/updated. Default is false.
  restore    = false      # A boolean to mark the container creation/update as a restore task.

  rootfs = {              # An object for configuring the root mount point of the container. Can only be specified once.
    size    = ""          # (required) Size of the underlying volume. Must end in G, M, or K (e.g. "1G", "1024M", "1048576K"). Note that this is a read only value.
    storage = "local-lvm" # (required) A string containing the volume, directory, or device to be mounted into the container (at the path specified by mp). E.g. local-lvm, local-zfs, local etc.
  }

  searchdomain    = ""    # Sets the DNS search domains for the container. If neither nameserver nor searchdomain are specified, the values of the Proxmox host will be used by default.
  ssh_public_keys = ""    # Multi-line string of SSH public keys that will be added to the container. Can be defined using Terraform's heredoc syntax.
  start           = false # A boolean that determines if the container is started after creation. Default is false.
  startup         = ""    # The startup and shutdown behaviour of the container.
  swap            = 512   # A number that sets the amount of swap memory available to the container. Default is 512.
  template        = false # A boolean that determines if this container is a template.
  tty             = 2     # A number that specifies the TTYs available to the container. Default is 2.
  unique          = true  # A boolean that determines if a unique random ethernet address is assigned to the container.
  unprivileged    = false # A boolean that makes the container run as an unprivileged user. Default is false.
  vmid            = 0     # A number that sets the VMID of the container. If set to 0, the next available VMID is used. Default is 0.
}