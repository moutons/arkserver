data "aws_ami" "arkserver_ami" {
  most_recent = true
  #executable_users = ["self"]

  name_regex = "^ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server"
  #owners = ["self"]
}

resource "aws_instance" "smouton-tirefire-ec2-arkserver-01" {
  ami = "${data.aws_ami.arkserver_ami.id}"
  instance_type = "${var.instance_type}"
  subnet_id = "${module.vpc.public_subnets[0]}"
  key_name = "${var.awskey_name}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.ark.id}"]
  tags {
    "Name" = "smouton-tirefire-ec2-arkserver-01"
    "X-Created-By" = "${var.email}"
    "Description" = "${var.description}"
  }
}