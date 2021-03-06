## all module outputs here

output "bastion-ip" {
  value = "${join(",",aws_instance.bastion.*.public_ip)}"
}

output "vpc_id" {
  value = "${aws_vpc.home.id}"
}

output "dashboard" {
  value = "https://${aws_lb.frontend.dns_name}"
}

output "hostname" {
  value = "${aws_lb.frontend.dns_name}"
}
# the `key` that represents that kub is ready
output "ready" {
  value = "${join(":",null_resource.init-master.*.id)}:${null_resource.finit-bastion.id}:${module.port-kubeapi.public_port}::${module.port-kubedash.public_port}::${aws_route.internet.id}"
}

# use the following as default params to create public listeners:
output "default_port_params" {
  value = "${data.null_data_source.default_port_params.outputs}"
}

output "kubeapi_token" {
  value = "${local.kubeapi_token}"
}
