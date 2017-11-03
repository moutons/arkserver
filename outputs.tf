output "arkserver-01-public_dns" {
  value = "${aws_instance.smouton-tirefire-ec2-arkserver-01.public_dns}"
}

output "arkserver-01-public_ip" {
  value = "${aws_instance.smouton-tirefire-ec2-arkserver-01.public_ip}"
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.vpc.vpc_id}"
}
