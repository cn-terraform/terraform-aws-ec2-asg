# AWS EC2 Auto Scaling Terraform Module #

This Terraform module deploys an AWS EC2 Auto Scaling Group.

[![](https://github.com/cn-terraform/terraform-aws-ec2-asg/workflows/terraform/badge.svg)](https://github.com/cn-terraform/terraform-aws-ec2-asg/actions?query=workflow%3Aterraform)
[![](https://img.shields.io/github/license/cn-terraform/terraform-aws-ec2-asg)](https://github.com/cn-terraform/terraform-aws-ec2-asg)
[![](https://img.shields.io/github/issues/cn-terraform/terraform-aws-ec2-asg)](https://github.com/cn-terraform/terraform-aws-ec2-asg)
[![](https://img.shields.io/github/issues-closed/cn-terraform/terraform-aws-ec2-asg)](https://github.com/cn-terraform/terraform-aws-ec2-asg)
[![](https://img.shields.io/github/languages/code-size/cn-terraform/terraform-aws-ec2-asg)](https://github.com/cn-terraform/terraform-aws-ec2-asg)
[![](https://img.shields.io/github/repo-size/cn-terraform/terraform-aws-ec2-asg)](https://github.com/cn-terraform/terraform-aws-ec2-asg)

## Usage

Check valid versions on:
* Github Releases: <https://github.com/cn-terraform/terraform-aws-ec2-asg/releases>
* Terraform Module Registry: <https://registry.terraform.io/modules/cn-terraform/ec2-asg/aws>

## Install pre commit hooks.

Pleas run this command right after cloning the repository.

        pre-commit install

For that you may need to install the folowwing tools:
* [Pre-commit](https://pre-commit.com/) 
* [Terraform Docs](https://terraform-docs.io/)

In order to run all checks at any point run the following command:

        pre-commit run --all-files

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.cpu_high](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.cpu_low](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_cloudwatch_metric_alarm.cpu_high_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.cpu_low_alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_launch_configuration.lc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | (Optional) Associate a public ip address with an instance in a VPC. | `bool` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | (Required only for EC2-Classic) A list of one or more availability zones for the group. This parameter should not be specified when using vpc\_zone\_identifier. | `list(any)` | `null` | no |
| <a name="input_default_cooldown"></a> [default\_cooldown](#input\_default\_cooldown) | (Optional, Default: 300) Time (in seconds) after a scaling activity completes before another scaling activity can start. | `number` | `300` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | (Optional) The number of Amazon EC2 instances that should be running in the group. (See also Waiting for Capacity.) | `number` | `1` | no |
| <a name="input_ebs_block_device"></a> [ebs\_block\_device](#input\_ebs\_block\_device) | (Optional) Additional EBS block devices to attach to the instance. This is a list of maps, where each map should contain "device\_name", "snapshot\_id", "volume\_type", "volume\_size", "iops", "delete\_on\_termination" and "encrypted" | `list(any)` | `[]` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | (Optional) If true, the launched EC2 instance will be EBS-optimized. | `bool` | `false` | no |
| <a name="input_enable_monitoring"></a> [enable\_monitoring](#input\_enable\_monitoring) | (Optional) Enables/disables detailed monitoring. This is enabled by default. | `bool` | `true` | no |
| <a name="input_enabled_metrics"></a> [enabled\_metrics](#input\_enabled\_metrics) | (Optional) A list of metrics to collect. The allowed values are GroupMinSize, GroupMaxSize, GroupDesiredCapacity, GroupInServiceInstances, GroupPendingInstances, GroupStandbyInstances, GroupTerminatingInstances, GroupTotalInstances. | `list(any)` | <pre>[<br>  "GroupMinSize",<br>  "GroupMaxSize",<br>  "GroupDesiredCapacity",<br>  "GroupInServiceInstances",<br>  "GroupPendingInstances",<br>  "GroupStandbyInstances",<br>  "GroupTerminatingInstances",<br>  "GroupTotalInstances"<br>]</pre> | no |
| <a name="input_ephemeral_block_device"></a> [ephemeral\_block\_device](#input\_ephemeral\_block\_device) | (Optional) Customize Ephemeral (also known as "Instance Store") volumes on the instance. This is a list of maps, where each map should contain "device\_name" and "virtual\_name" | `list(any)` | `[]` | no |
| <a name="input_force_delete"></a> [force\_delete](#input\_force\_delete) | (Optional) Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. You can force an autoscaling group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling. | `bool` | `false` | no |
| <a name="input_health_check_grace_period"></a> [health\_check\_grace\_period](#input\_health\_check\_grace\_period) | (Optional, Default: 300) Time (in seconds) after instance comes into service before checking health. | `number` | `300` | no |
| <a name="input_health_check_type"></a> [health\_check\_type](#input\_health\_check\_type) | (Optional) "EC2" or "ELB". Controls how health checking is done. | `string` | `"EC2"` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | (Optional) The name attribute of the IAM instance profile to associate with launched instances. | `string` | `""` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The EC2 image ID to launch. | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The size of instance to launch. | `any` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | (Optional) The key name that should be used for the instance. | `string` | `""` | no |
| <a name="input_load_balancers"></a> [load\_balancers](#input\_load\_balancers) | (Optional) A list of elastic load balancer names to add to the autoscaling group names. Only valid for classic load balancers. For ALBs, use target\_group\_arns instead. | `list(any)` | `[]` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | The maximum size of the auto scale group. | `number` | n/a | yes |
| <a name="input_metrics_granularity"></a> [metrics\_granularity](#input\_metrics\_granularity) | (Optional) The granularity to associate with the metrics to collect. The only valid value is 1Minute. Default is 1Minute. | `string` | `"1Minute"` | no |
| <a name="input_min_elb_capacity"></a> [min\_elb\_capacity](#input\_min\_elb\_capacity) | (Optional) Setting this causes Terraform to wait for this number of instances from this autoscaling group to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes. (See also Waiting for Capacity.) | `number` | `0` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | The minimum size of the auto scale group. (See also Waiting for Capacity.) | `number` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix for resources on AWS | `any` | n/a | yes |
| <a name="input_placement_group"></a> [placement\_group](#input\_placement\_group) | (Optional) The name of the placement group into which you'll launch your instances, if any. | `string` | `""` | no |
| <a name="input_placement_tenancy"></a> [placement\_tenancy](#input\_placement\_tenancy) | (Optional) The tenancy of the instance. Valid values are "default" or "dedicated", see AWS's Create Launch Configuration for more details | `string` | `"default"` | no |
| <a name="input_protect_from_scale_in"></a> [protect\_from\_scale\_in](#input\_protect\_from\_scale\_in) | (Optional) Allows setting instance protection. The autoscaling group will not select instances with this setting for terminination during scale in events. | `bool` | `false` | no |
| <a name="input_root_block_device"></a> [root\_block\_device](#input\_root\_block\_device) | (Optional) Customize details about the root block device of the instance. This is a list of maps, where each map should contain "volume\_type", "volume\_size", "iops" and "delete\_on\_termination" | `list(any)` | `[]` | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | (Optional) A list of associated security group IDS. | `list(any)` | `[]` | no |
| <a name="input_service_linked_role_arn"></a> [service\_linked\_role\_arn](#input\_service\_linked\_role\_arn) | (Optional) The ARN of the service-linked role that the ASG will use to call other AWS services | `string` | `""` | no |
| <a name="input_spot_price"></a> [spot\_price](#input\_spot\_price) | (Optional) The maximum price to use for reserving spot instances. (Default: On-demand price) | `string` | `""` | no |
| <a name="input_suspended_processes"></a> [suspended\_processes](#input\_suspended\_processes) | (Optional) A list of processes to suspend for the AutoScaling Group. The allowed values are Launch, Terminate, HealthCheck, ReplaceUnhealthy, AZRebalance, AlarmNotification, ScheduledActions, AddToLoadBalancer. Note that if you suspend either the Launch or Terminate process types, it can prevent your autoscaling group from functioning properly. | `list(any)` | `[]` | no |
| <a name="input_target_group_arns"></a> [target\_group\_arns](#input\_target\_group\_arns) | (Optional) A list of aws\_alb\_target\_group ARNs, for use with Application or Network Load Balancing. | `list(any)` | `[]` | no |
| <a name="input_termination_policies"></a> [termination\_policies](#input\_termination\_policies) | (Optional) A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, OldestLaunchTemplate, AllocationStrategy, Default. | `list(any)` | <pre>[<br>  "Default"<br>]</pre> | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | (Optional) The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user\_data\_base64 instead. | `any` | `null` | no |
| <a name="input_user_data_base64"></a> [user\_data\_base64](#input\_user\_data\_base64) | (Optional) Can be used instead of user\_data to pass base64-encoded binary data directly. Use this instead of user\_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption. | `any` | `null` | no |
| <a name="input_vpc_classic_link_id"></a> [vpc\_classic\_link\_id](#input\_vpc\_classic\_link\_id) | (Optional) The ID of a ClassicLink-enabled VPC. Only applies to EC2-Classic instances. (eg. vpc-2730681a) | `string` | `""` | no |
| <a name="input_vpc_classic_link_security_groups"></a> [vpc\_classic\_link\_security\_groups](#input\_vpc\_classic\_link\_security\_groups) | (Optional) The IDs of one or more security groups for the specified ClassicLink-enabled VPC (eg. sg-46ae3d11). | `list` | `[]` | no |
| <a name="input_vpc_zone_identifier"></a> [vpc\_zone\_identifier](#input\_vpc\_zone\_identifier) | (Optional) A list of subnet IDs to launch resources in. | `list(any)` | `null` | no |
| <a name="input_wait_for_capacity_timeout"></a> [wait\_for\_capacity\_timeout](#input\_wait\_for\_capacity\_timeout) | (Optional) A maximum duration that Terraform should wait for ASG instances to be healthy before timing out (See also Waiting for Capacity.) Setting this to "0" causes Terraform to skip all Capacity Waiting behavior (Default: "10m"). | `string` | `"10m"` | no |
| <a name="input_wait_for_elb_capacity"></a> [wait\_for\_elb\_capacity](#input\_wait\_for\_elb\_capacity) | (Optional) Setting this will cause Terraform to wait for exactly this number of healthy instances from this autoscaling group in all attached load balancers on both create and update operations. (Takes precedence over min\_elb\_capacity behavior.) (See also Waiting for Capacity.) | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_arn"></a> [asg\_arn](#output\_asg\_arn) | The ARN for this AutoScaling Group. |
| <a name="output_asg_availability_zones"></a> [asg\_availability\_zones](#output\_asg\_availability\_zones) | The availability zones of the autoscale group. |
| <a name="output_asg_default_cooldown"></a> [asg\_default\_cooldown](#output\_asg\_default\_cooldown) | Time between a scaling activity and the succeeding scaling activity. |
| <a name="output_asg_desired_capacity"></a> [asg\_desired\_capacity](#output\_asg\_desired\_capacity) | The number of Amazon EC2 instances that should be running in the group. |
| <a name="output_asg_health_check_grace_period"></a> [asg\_health\_check\_grace\_period](#output\_asg\_health\_check\_grace\_period) | Time after instance comes into service before checking health. |
| <a name="output_asg_health_check_type"></a> [asg\_health\_check\_type](#output\_asg\_health\_check\_type) | "EC2" or "ELB". Controls how health checking is done. |
| <a name="output_asg_id"></a> [asg\_id](#output\_asg\_id) | The autoscaling group id. |
| <a name="output_asg_launch_configuration"></a> [asg\_launch\_configuration](#output\_asg\_launch\_configuration) | The launch configuration of the autoscale group. |
| <a name="output_asg_load_balancers"></a> [asg\_load\_balancers](#output\_asg\_load\_balancers) | (Optional) The load balancer names associated with the autoscaling group. |
| <a name="output_asg_max_size"></a> [asg\_max\_size](#output\_asg\_max\_size) | The maximum size of the autoscale group. |
| <a name="output_asg_min_size"></a> [asg\_min\_size](#output\_asg\_min\_size) | The minimum size of the autoscale group. |
| <a name="output_asg_name"></a> [asg\_name](#output\_asg\_name) | The name of the autoscale group. |
| <a name="output_asg_target_group_arns"></a> [asg\_target\_group\_arns](#output\_asg\_target\_group\_arns) | (Optional) list of Target Group ARNs that apply to this AutoScaling Group. |
| <a name="output_asg_vpc_zone_identifier"></a> [asg\_vpc\_zone\_identifier](#output\_asg\_vpc\_zone\_identifier) | (Optional) The VPC zone identifier. |
| <a name="output_cpu_high_adjustment_type"></a> [cpu\_high\_adjustment\_type](#output\_cpu\_high\_adjustment\_type) | The scaling policy's adjustment type. |
| <a name="output_cpu_high_alarm_arn"></a> [cpu\_high\_alarm\_arn](#output\_cpu\_high\_alarm\_arn) | (Optional) list of Target Group ARNs that apply to this AutoScaling Group. |
| <a name="output_cpu_high_alarm_id"></a> [cpu\_high\_alarm\_id](#output\_cpu\_high\_alarm\_id) | The ID of the health check. |
| <a name="output_cpu_high_arn"></a> [cpu\_high\_arn](#output\_cpu\_high\_arn) | The ARN assigned by AWS to the scaling policy. |
| <a name="output_cpu_high_autoscaling_group_name"></a> [cpu\_high\_autoscaling\_group\_name](#output\_cpu\_high\_autoscaling\_group\_name) | The scaling policy's assigned autoscaling group. |
| <a name="output_cpu_high_name"></a> [cpu\_high\_name](#output\_cpu\_high\_name) | The scaling policy's name. |
| <a name="output_cpu_high_policy_type"></a> [cpu\_high\_policy\_type](#output\_cpu\_high\_policy\_type) | The scaling policy's type. |
| <a name="output_cpu_low_adjustment_type"></a> [cpu\_low\_adjustment\_type](#output\_cpu\_low\_adjustment\_type) | The scaling policy's adjustment type. |
| <a name="output_cpu_low_alarm_arn"></a> [cpu\_low\_alarm\_arn](#output\_cpu\_low\_alarm\_arn) | (Optional) list of Target Group ARNs that apply to this AutoScaling Group. |
| <a name="output_cpu_low_alarm_id"></a> [cpu\_low\_alarm\_id](#output\_cpu\_low\_alarm\_id) | The ID of the health check. |
| <a name="output_cpu_low_arn"></a> [cpu\_low\_arn](#output\_cpu\_low\_arn) | The ARN assigned by AWS to the scaling policy. |
| <a name="output_cpu_low_autoscaling_group_name"></a> [cpu\_low\_autoscaling\_group\_name](#output\_cpu\_low\_autoscaling\_group\_name) | The scaling policy's assigned autoscaling group. |
| <a name="output_cpu_low_name"></a> [cpu\_low\_name](#output\_cpu\_low\_name) | The scaling policy's name. |
| <a name="output_cpu_low_policy_type"></a> [cpu\_low\_policy\_type](#output\_cpu\_low\_policy\_type) | The scaling policy's type. |
| <a name="output_lc_id"></a> [lc\_id](#output\_lc\_id) | The ID of the launch configuration. |
| <a name="output_lc_name"></a> [lc\_name](#output\_lc\_name) | The name of the launch configuration. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
