
#HTTP 4X error for more than the threshould value

resource "aws_cloudwatch_metric_alarm" "alb_4xx_errors" {
  alarm_name                = "app1-http-alb-4xx-errors"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm       = "2"
  evaluation_periods        = "3"
  metric_name               = "HTTPCode_Target_4XX_Count"
  namespace                 = "AWS/ApplicationELB"
  period                    = "120"
  statistic                 = "Sum"
  threshold                 = "5"
  treat_missing_data = "missing"
  dimensions = {
    LoadBalancer = module.alb.lb_arn_suffix
  }
  alarm_description = "This metric is for ALB monitoring and triggers asg when the http 4xx count is more that 5"

  ok_actions = [aws_sns_topic.myasg_sns_topic.arn]
  alarm_actions = [aws_sns_topic.myasg_sns_topic.arn]
}
