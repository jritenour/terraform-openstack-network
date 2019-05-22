provider "openstack" {
  user_name = "${data.vault_generic_secret.openstack_credentials.data["user_name"]}"
  tenant_name       = "${var.project_name}"
  password     = "${data.vault_generic_secret.openstack_credentials.data["password"]}"
  auth_url   = "${data.vault_generic_secret.openstack_credentials.data["auth_url"]}"
  region   = "${data.vault_generic_secret.openstack_credentials.data["region"]}"
}

resource "openstack_networking_network_v2" "network" {
  name = "${var.netname}"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  name = "${var.subnet}"
  network="${openstack_networking_network_v2.network.id}"
}
