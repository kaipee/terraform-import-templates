resource "aws_ec2_host" "name" {
  auto_placement    = "on"        # (Optional) Indicates whether the host accepts any untargeted instance launches that match its instance type configuration, or if it only accepts Host tenancy instance launches that specify its unique host ID. Valid values: on, off. Default: on.
  availability_zone = "us-east-1" # (Required) The Availability Zone in which to allocate the Dedicated Host.
  host_recovery     = "off"       # (Optional) Indicates whether to enable or disable host recovery for the Dedicated Host. Valid values: on, off. Default: off.
  #instance_family = ""  # (Optional) Specifies the instance family to be supported by the Dedicated Hosts. If you specify an instance family, the Dedicated Hosts support multiple instance types within that instance family. Exactly one of instance_family or instance_type must be specified.
  instance_type = "t2.small" # (Optional) Specifies the instance type to be supported by the Dedicated Hosts. If you specify an instance type, the Dedicated Hosts support instances of the specified instance type only. Exactly one of instance_family or instance_type must be specified.
  tags = {                   # (Optional) Map of tags to assign to this resource. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level.
    Name        = "name"
    Environment = "Test"
  }
}
