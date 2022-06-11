#The ASG Scaling Policies like Simple scaling Target Tracking dynamic Scaling

#Autoscaling with increase capacity 
resource "aws_autoscaling_schedule" "increase_capacity_9am" {
  scheduled_action_name  = "increase_capacity_9am"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 6
  start_time             = "2022-05-16T14:00:00Z"
  recurrence             = "00 09 * * *" 
  autoscaling_group_name =  module.autoscaling.autoscaling_group_id
  }

#Autoscaling with decrease capacity
  resource "aws_autoscaling_schedule" "decrease_capacity_9pm" {
  scheduled_action_name  = "decrease_capacity_9pm"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 2
  start_time             = "2022-05-16T21:00:00Z"
  recurrence             = "00 21 * * *" 
  autoscaling_group_name =  module.autoscaling.autoscaling_group_id
  }