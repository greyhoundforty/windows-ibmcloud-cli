# resource "random_id" "winpass" {
#   byte_length = 16
# }

resource "ibm_compute_vm_instance" "win2019_devnode" {
  hostname             = "windev-rt"
  domain               = var.domain
  os_reference_code    = var.os_image
  datacenter           = var.datacenter
  network_speed        = 1000
  hourly_billing       = true
  private_network_only = false
  local_disk           = true
  flavor_key_name      = var.flavor
  tags                 = [var.datacenter, "ryantiffany"]
  # user_metadata        = templatefile("${path.module}/windows-install.yml", { password = random_id.winpass.hex })
}