# ---------------------------------------------------------------------------------------------------------------------
# PROVIDER
# ---------------------------------------------------------------------------------------------------------------------
provider "aws" {
  profile = var.profile
  region  = var.region
}

# ---------------------------------------------------------------------------------------------------------------------
# Launch Configuration
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_launch_configuration" "lc" {
  name                             = "${var.name_preffix}_lc"
  image_id                         = var.image_id
  instance_type                    = var.instance_type
  iam_instance_profile             = var.iam_instance_profile
  key_name                         = var.key_name
  security_groups                  = var.security_groups
  associate_public_ip_address      = var.associate_public_ip_address
  vpc_classic_link_id              = var.vpc_classic_link_id
  vpc_classic_link_security_groups = var.vpc_classic_link_security_groups
  user_data                        = var.user_data
  user_data_base64                 = var.user_data_base64
  enable_monitoring                = var.enable_monitoring
  ebs_optimized                    = var.ebs_optimized
  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
    }
  }
  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      no_device             = lookup(ebs_block_device.value, "no_device", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }
  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_device
      content {
      device_name  = ephemeral_block_device.value.device_name
      virtual_name = ephemeral_block_device.value.virtual_name
    }
  }
  spot_price                       = var.spot_price
  placement_tenancy                = var.placement_tenancy
}

# ---------------------------------------------------------------------------------------------------------------------
# Auto Scaling Group
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_autoscaling_group" "asg" {
  depends_on                = [aws_launch_configuration.lc]
  name                      = "${var.name_preffix}_asg"
  max_size                  = var.max_size
  min_size                  = var.min_size
  availability_zones        = var.availability_zones
  default_cooldown          = var.default_cooldown
  launch_configuration      = aws_launch_configuration.lc.name
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  desired_capacity          = var.desired_capacity
  force_delete              = var.force_delete
  load_balancers            = var.load_balancers
  vpc_zone_identifier       = var.vpc_zone_identifier
  target_group_arns         = var.target_group_arns
  termination_policies      = var.termination_policies
  suspended_processes       = var.suspended_processes
  placement_group           = var.placement_group
  metrics_granularity       = var.metrics_granularity
  enabled_metrics           = var.enabled_metrics
  wait_for_capacity_timeout = var.wait_for_capacity_timeout
  min_elb_capacity          = var.min_elb_capacity
  wait_for_elb_capacity     = var.wait_for_elb_capacity
  protect_from_scale_in     = var.protect_from_scale_in
  service_linked_role_arn   = var.service_linked_role_arn
  tags = [
    {
      key                 = "Name"
      value               = "${var.name_preffix}_asg"
      propagate_at_launch = true
    },
  ]
}