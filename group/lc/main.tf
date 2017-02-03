# AWS Launch Configuration

## Creates security group
resource "aws_security_group" "sg_asg" {
  description = "${var.stack_item_fullname} security group"
  name_prefix = "${var.stack_item_label}-asg-"
  vpc_id      = "${var.vpc_id}"

  tags {
    application = "${var.stack_item_fullname}"
    managed_by  = "terraform"
    Name        = "${var.stack_item_label}-asg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

## Creates launch configuration
resource "aws_launch_configuration" "lc" {
  count = "${length(var.ebs_vol_snapshot_id) > 0 ? 0 : 1}"

  associate_public_ip_address = "${var.associate_public_ip_address}"
  ebs_optimized               = "${var.ebs_optimized}"
  enable_monitoring           = "${var.enable_monitoring}"
  iam_instance_profile        = "${var.instance_profile}"
  image_id                    = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  name_prefix                 = "${var.stack_item_label}-"
  placement_tenancy           = "${var.placement_tenancy}"
  security_groups             = ["${aws_security_group.sg_asg.id}"]
  user_data                   = "${var.user_data}"

  root_block_device {
    delete_on_termination = "${var.root_vol_del_on_term}"
    iops                  = "${var.root_vol_type == "io1" ? var.root_vol_iops : 0 }"
    volume_type           = "${var.root_vol_type}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "lc_ebs" {
  count = "${length(var.ebs_vol_snapshot_id) > 0 ? 1 : 0}"

  associate_public_ip_address = "${var.associate_public_ip_address}"
  ebs_optimized               = "${var.ebs_optimized}"
  enable_monitoring           = "${var.enable_monitoring}"
  iam_instance_profile        = "${var.instance_profile}"
  image_id                    = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  name_prefix                 = "${var.stack_item_label}-"
  placement_tenancy           = "${var.placement_tenancy}"
  security_groups             = ["${aws_security_group.sg_asg.id}"]
  user_data                   = "${var.user_data}"

  root_block_device {
    delete_on_termination = "${var.root_vol_del_on_term}"
    iops                  = "${var.root_vol_type == "io1" ? var.root_vol_iops : 0 }"
    volume_type           = "${var.root_vol_type}"
  }

  ebs_block_device {
    delete_on_termination = "${var.ebs_vol_del_on_term}"
    device_name           = "${var.ebs_vol_device_name}"
    iops                  = "${var.ebs_vol_type == "io1" ? var.ebs_vol_iops : 0 }"
    snapshot_id           = "${var.ebs_vol_snapshot_id}"
    volume_type           = "${var.ebs_vol_type}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
