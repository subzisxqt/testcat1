output "ec2_global_ips" {
  value = "${aws_instance.serverofcat.public_ip}"
}
