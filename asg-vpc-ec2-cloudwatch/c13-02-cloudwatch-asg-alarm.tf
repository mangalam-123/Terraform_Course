
#Simple asg policy
resource "aws_autoscaling_policy" "high_cpu" {
  name                   = "high-cpu"
  scaling_adjustment     = 4                       #no of ec2-instances 
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = module.autoscaling.autoscaling_group_name

}
 #Cloud watch alarm to trigger the above scalinng policy when cpu is above 80%

 resource "aws_cloudwatch_metric_alarm" "app1_asg_high_cpu_cwa" {
  alarm_name                = "app1-asg-high-cpu-cwa5"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  dimensions = {
    AutoScalingGroupName = module.autoscaling.autoscaling_group_name
}
  
  alarm_description = "This metric is for ec2 cpu monitoring and triggers asg when the value is abobe 80%"

  ok_actions = [aws_sns_topic.myasg_sns_topic.arn]
  alarm_actions = [
      aws_autoscaling_policy.high_cpu.arn,
      aws_sns_topic.myasg_sns_topic.arn
  ]
}
