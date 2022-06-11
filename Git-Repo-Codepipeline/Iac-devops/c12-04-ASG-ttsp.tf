#Target tracking Scaling Policy (TTSP)
#TragetScalig property for AVF CPU utilization
resource "aws_autoscaling_policy" "myavg_cpu_greater_than_xx" {
  name                   = "${local.name}-myavg_cpu_greater_than_xx"
  policy_type =  "TargetTrackingScaling"
  estimated_instance_warmup = 180
  autoscaling_group_name =  module.autoscaling.autoscaling_group_id
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50.0
  }
}

#AL Target Request calling 
resource "aws_autoscaling_policy" "alb_target_greater_than_yy" {
  name                   = "${local.name}-alb_target_greater_than_yy"
  policy_type =  "TargetTrackingScaling"
  estimated_instance_warmup = 180
  autoscaling_group_name = module.autoscaling.autoscaling_group_id
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBRequestCountPerTarget"
      resource_label = "${module.alb.lb_arn_suffix}/${module.alb.target_group_arn_suffixes[0]}"
    }

    target_value = 10.0
  }
}