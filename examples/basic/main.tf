# Basic ASG Example

## Configures providers
provider "aws" {
  region = "${var.region}"
}

## Adds security group rules
resource "aws_security_group_rule" "sg_asg_egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = -1
  security_group_id = "${module.example.sg_id}"
  to_port           = 0
  type              = "egress"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "sg_asg_ssh" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = "${module.example.sg_id}"
  to_port           = 22
  type              = "ingress"

  lifecycle {
    create_before_destroy = true
  }
}

## Provisions basic autoscaling group
module "example" {
  # Example GitHub source
  #source = "github.com/unifio/terraform-aws-asg//group"
  source = "../../group"

  # Resource tags
  stack_item_fullname = "${var.stack_item_fullname}"
  stack_item_label    = "${var.stack_item_label}"

  # VPC parameters
  region  = "${var.region}"
  subnets = "${var.lan_subnet_ids}"
  vpc_id  = "${var.vpc_id}"

  # LC parameters
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  # ASG parameters
  max_size = 1
  min_size = 1
}
