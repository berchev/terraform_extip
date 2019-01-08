provider "null" {}

data "extip" "external_ip" {}

resource "null_resource" "georgiman" {
  triggers {
    build_number = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo hello georgiman"
  }
}

output "external_ip" {
  value = "${data.extip.external_ip.ipaddress}"
}

