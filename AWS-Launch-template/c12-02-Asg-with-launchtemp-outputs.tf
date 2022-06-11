# ASG Outputs
# Launch configuration Outputs
output "launch_template_id" {
  description = "The ID of the launch configuration"
  value       = aws_launch_template.my_launch_template.id
}

output "launch_template_version" {
  description = "The ARN of the launch configuration"
  value       = aws_launch_template.my_launch_template.latest_version
}


# Autoscaling Outpus
output "autoscaling_group_id" {
  description = "The autoscaling group id"
  value       = aws_autoscaling_group.my_asg.id
}

output "autoscaling_group_name" {
  description = "The autoscaling group name"
  value       = aws_autoscaling_group.my_asg.name
}

output "autoscaling_group_arn" {
  description = "The ARN for this AutoScaling Group"
  value       = aws_autoscaling_group.my_asg.arn
}

output "autoscaling_group_min_size" {
  description = "The minimum size of the autoscale group"
  value       = aws_autoscaling_group.my_asg.min_size
}

output "autoscaling_group_max_size" {
  description = "The maximum size of the autoscale group"
  value       = aws_autoscaling_group.my_asg.max_size
}

