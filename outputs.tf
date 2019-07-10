# ---------------------------------------------------------------------------------------------------------------------
# AWS EC2 AUTO SCALING GROUP
# ---------------------------------------------------------------------------------------------------------------------
output "asg_id" {
    description = "The autoscaling group id."
    value       = aws_autoscaling_group.asg.id
}
output "asg_arn" {
    description = "The ARN for this AutoScaling Group."
    value       = aws_autoscaling_group.asg.arn
}
output "asg_availability_zones" {
    description = "The availability zones of the autoscale group."
    value       = aws_autoscaling_group.asg.availability_zones
}
output "asg_min_size" {
    description = "The minimum size of the autoscale group."
    value       = aws_autoscaling_group.asg.min_size
}
output "asg_max_size" {
    description = "The maximum size of the autoscale group."
    value       = aws_autoscaling_group.asg.max_size
}
output "asg_default_cooldown" {
    description = "Time between a scaling activity and the succeeding scaling activity."
    value       = aws_autoscaling_group.asg.default_cooldown
}
output "asg_name" {
    description = "The name of the autoscale group."
    value       = aws_autoscaling_group.asg.name
}
output "asg_health_check_grace_period" {
    description = "Time after instance comes into service before checking health."
    value       = aws_autoscaling_group.asg.health_check_grace_period
}
output "asg_health_check_type" {
    description = "\"EC2\" or \"ELB\". Controls how health checking is done."
    value       = aws_autoscaling_group.asg.health_check_type
}
output "asg_desired_capacity" {
    description = "The number of Amazon EC2 instances that should be running in the group."
    value       = aws_autoscaling_group.asg.desired_capacity
}
output "asg_launch_configuration" {
    description = "The launch configuration of the autoscale group."
    value       = aws_autoscaling_group.asg.launch_configuration
}
output "asg_vpc_zone_identifier" {
    description = "(Optional) The VPC zone identifier."
    value       = aws_autoscaling_group.asg.vpc_zone_identifier
}
output "asg_load_balancers" {
    description = "(Optional) The load balancer names associated with the autoscaling group."
    value       = aws_autoscaling_group.asg.load_balancers
}
output "asg_target_group_arns" {
    description = "(Optional) list of Target Group ARNs that apply to this AutoScaling Group."
    value       = aws_autoscaling_group.asg.target_group_arns
}
