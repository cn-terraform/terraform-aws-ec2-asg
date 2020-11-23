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

## Output values
* lc_name: The name of the launch configuration.
* lc_id: The ID of the launch configuration.
* asg_id: The autoscaling group id.
* asg_arn: The ARN for this AutoScaling Group.
* asg_availability_zones: The availability zones of the autoscale group.
* asg_min_size: The minimum size of the autoscale group.
* asg_max_size: The maximum size of the autoscale group.
* asg_default_cooldown: Time between a scaling activity and the succeeding scaling activity.
* asg_name: The name of the autoscale group.
* asg_health_check_grace_period: Time after instance comes into service before checking health.
* asg_health_check_type: EC2 or ELB. Controls how health checking is done.
* asg_desired_capacity: The number of Amazon EC2 instances that should be running in the group.
* asg_launch_configuration: The launch configuration of the autoscale group.
* asg_vpc_zone_identifier: (Optional) The VPC zone identifier.
* asg_load_balancers: (Optional) The load balancer names associated with the autoscaling group.
* asg_target_group_arns: (Optional) list of Target Group ARNs that apply to this AutoScaling Group.
* cpu_high_name: The scaling policy's name.
* cpu_high_arn: The ARN assigned by AWS to the scaling policy.
* cpu_high_autoscaling_group_name: The scaling policy's assigned autoscaling group.
* cpu_high_adjustment_type: The scaling policy's adjustment type.
* cpu_high_policy_type: The scaling policy's type.
* cpu_low_name: The scaling policy's name.
* cpu_low_arn: The ARN assigned by AWS to the scaling policy.
* cpu_low_autoscaling_group_name: The scaling policy's assigned autoscaling group.
* cpu_low_adjustment_type: The scaling policy's adjustment type.
* cpu_low_policy_type: The scaling policy's type.
* cpu_high_alarm_id: The ID of the health check.
* cpu_high_alarm_arn: (Optional) list of Target Group ARNs that apply to this AutoScaling Group.
* cpu_low_alarm_id: The ID of the health check.
* cpu_low_alarm_arn: (Optional) list of Target Group ARNs that apply to this AutoScaling Group.
