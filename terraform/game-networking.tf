module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "tirefire-game-vpc"

  cidr = "10.20.0.0/16"

  azs             = ["us-west-2a"]
  private_subnets = ["10.20.1.0/24"]
  public_subnets  = ["10.20.101.0/24"]

  enable_dns_hostnames = true
  enable_dns_support = true
  enable_nat_gateway = false
  # single_nat_gateway = true
  map_public_ip_on_launch = true

  tags {
    "Name" = "smouton-tirefire-vpc-01"
    "X-Created-By" = "${var.email}"
    "Description" = "${var.description}"
  }
}

resource "aws_security_group" "ark" {
    name = "ark-secgroup"
    description = "Allow traffic to pass from the ark server to the internet"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 7777
        to_port = 7777
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 7778
        to_port = 7778
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 27015
        to_port = 27015
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 27020
        to_port = 27020
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${module.vpc.vpc_id}"

    tags {
        Name = "smouton-tirefire-secgroup-01"
        Description = "Security Group for games and stuff"
    }
}