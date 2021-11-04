#------------------------------------------------------------------------------
# Misc
#------------------------------------------------------------------------------
variable "name_prefix" {
  description = "Name prefix for resources on AWS"
}

#------------------------------------------------------------------------------
# AWS EC2 LAUNCH CONFIGURATION
#------------------------------------------------------------------------------
variable "image_id" {
  description = "The EC2 image ID to launch."
}
variable "instance_type" {
  description = "The size of instance to launch."
}
variable "iam_instance_profile" {
  description = "(Optional) The name attribute of the IAM instance profile to associate with launched instances."
  default     = ""
}
variable "key_name" {
  description = "(Optional) The key name that should be used for the instance."
  default     = ""
}
variable "security_groups" {
  description = "(Optional) A list of associated security group IDS."
  type        = list(any)
  default     = []
}
variable "associate_public_ip_address" {
  description = "(Optional) Associate a public ip address with an instance in a VPC."
  type        = bool
}
variable "vpc_classic_link_id" {
  description = "(Optional) The ID of a ClassicLink-enabled VPC. Only applies to EC2-Classic instances. (eg. vpc-2730681a)"
  default     = ""
}
variable "vpc_classic_link_security_groups" {
  description = "(Optional) The IDs of one or more security groups for the specified ClassicLink-enabled VPC (eg. sg-46ae3d11)."
  default     = []
}
variable "user_data" {
  description = "(Optional) The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  default     = null
}
variable "user_data_base64" {
  description = "(Optional) Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption."
  default     = null
}
variable "enable_monitoring" {
  description = "(Optional) Enables/disables detailed monitoring. This is enabled by default."
  type        = bool
  default     = true
}
variable "ebs_optimized" {
  description = "(Optional) If true, the launched EC2 instance will be EBS-optimized."
  type        = bool
  default     = false
}
variable "root_block_device" {
  description = "(Optional) Customize details about the root block device of the instance. This is a list of maps, where each map should contain \"volume_type\", \"volume_size\", \"iops\" and \"delete_on_termination\""
  type        = list(any)
  default     = []
}
variable "ebs_block_device" {
  description = "(Optional) Additional EBS block devices to attach to the instance. This is a list of maps, where each map should contain \"device_name\", \"snapshot_id\", \"volume_type\", \"volume_size\", \"iops\", \"delete_on_termination\" and \"encrypted\""
  type        = list(any)
  default     = []
}
variable "ephemeral_block_device" {
  description = "(Optional) Customize Ephemeral (also known as \"Instance Store\") volumes on the instance. This is a list of maps, where each map should contain \"device_name\" and \"virtual_name\""
  type        = list(any)
  default     = []
}
variable "spot_price" {
  description = "(Optional) The maximum price to use for reserving spot instances. (Default: On-demand price)"
  default     = ""
}
variable "placement_tenancy" {
  description = "(Optional) The tenancy of the instance. Valid values are \"default\" or \"dedicated\", see AWS's Create Launch Configuration for more details"
  default     = "default"
}

#------------------------------------------------------------------------------
# AWS EC2 AUTO SCALING GROUP
#------------------------------------------------------------------------------
variable "max_size" {
  description = "The maximum size of the auto scale group."
  type        = number
}
variable "min_size" {
  description = "The minimum size of the auto scale group. (See also Waiting for Capacity.)"
  type        = number
}
variable "availability_zones" {
  description = "(Required only for EC2-Classic) A list of one or more availability zones for the group. This parameter should not be specified when using vpc_zone_identifier."
  type        = list(any)
  default     = null
}
variable "default_cooldown" {
  description = "(Optional, Default: 300) Time (in seconds) after a scaling activity completes before another scaling activity can start."
  type        = number
  default     = 300
}
variable "health_check_grace_period" {
  description = "(Optional, Default: 300) Time (in seconds) after instance comes into service before checking health."
  type        = number
  default     = 300
}
variable "health_check_type" {
  description = "(Optional) \"EC2\" or \"ELB\". Controls how health checking is done."
  default     = "EC2"
}
variable "desired_capacity" {
  description = "(Optional) The number of Amazon EC2 instances that should be running in the group. (See also Waiting for Capacity.)"
  type        = number
  default     = 1
}
variable "force_delete" {
  description = "(Optional) Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. You can force an autoscaling group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling."
  type        = bool
  default     = false
}
variable "load_balancers" {
  description = "(Optional) A list of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers. For ALBs, use target_group_arns instead."
  type        = list(any)
  default     = []
}
variable "vpc_zone_identifier" {
  description = "(Optional) A list of subnet IDs to launch resources in."
  type        = list(any)
  default     = null
}
variable "target_group_arns" {
  description = "(Optional) A list of aws_alb_target_group ARNs, for use with Application or Network Load Balancing."
  type        = list(any)
  default     = []
}
variable "termination_policies" {
  description = "(Optional) A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, OldestLaunchTemplate, AllocationStrategy, Default."
  type        = list(any)
  default     = ["Default"]
}
variable "suspended_processes" {
  description = "(Optional) A list of processes to suspend for the AutoScaling Group. The allowed values are Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer. Note that if you suspend either the Launch or Terminate process types, it can prevent your autoscaling group from functioning properly."
  type        = list(any)
  default     = []
}
variable "placement_group" {
  description = "(Optional) The name of the placement group into which you'll launch your instances, if any."
  default     = ""
}
variable "metrics_granularity" {
  description = "(Optional) The granularity to associate with the metrics to collect. The only valid value is 1Minute. Default is 1Minute."
  default     = "1Minute"
}
variable "enabled_metrics" {
  description = "(Optional) A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances."
  type        = list(any)
  default     = ["GroupMinSize", "GroupMaxSize", "GroupDesiredCapacity", "GroupInServiceInstances", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances", ]
}
variable "wait_for_capacity_timeout" {
  description = "(Optional) A maximum duration that Terraform should wait for ASG instances to be healthy before timing out (See also Waiting for Capacity.) Setting this to \"0\" causes Terraform to skip all Capacity Waiting behavior (Default: \"10m\")."
  default     = "10m"
}
variable "min_elb_capacity" {
  description = "(Optional) Setting this causes Terraform to wait for this number of instances from this autoscaling group to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes. (See also Waiting for Capacity.)"
  type        = number
  default     = 0
}
variable "wait_for_elb_capacity" {
  description = "(Optional) Setting this will cause Terraform to wait for exactly this number of healthy instances from this autoscaling group in all attached load balancers on both create and update operations. (Takes precedence over min_elb_capacity behavior.) (See also Waiting for Capacity.)"
  type        = number
  default     = null
}
variable "protect_from_scale_in" {
  description = "(Optional) Allows setting instance protection. The autoscaling group will not select instances with this setting for terminination during scale in events."
  type        = bool
  default     = false
}
variable "service_linked_role_arn" {
  description = "(Optional) The ARN of the service-linked role that the ASG will use to call other AWS services"
  default     = ""
}
# NOT CONSIDERED
# launch_template - (Optional) Nested argument with Launch template specification to use to launch instances.
# mixed_instances_policy (Optional) Configuration block containing settings to define launch targets for Auto Scaling groups. Defined below.
# initial_lifecycle_hook - (Optional) One or more Lifecycle Hooks to attach to the autoscaling group before instances are launched. The syntax is exactly the same as the separate aws_autoscaling_lifecycle_hook resource, without the autoscaling_group_name attribute. Please note that this will only work when creating a new autoscaling group. For all other use-cases, please use aws_autoscaling_lifecycle_hook resource.
