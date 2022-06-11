
#Cloud watch log group infor pre req

resource "aws_cloudwatch_log_group" "cis_log_group" {
  name = "cis-log-group-${random_pet.this.id}"
}

#Center of internal Security for Cloud alarm 
module "all_cis_alarms" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/cis-alarms"
  version = "3.2.0"

  disabled_controls = ["DisableOrDeleteCMK", "VPCChanges"]

  log_group_name = aws_cloudwatch_log_group.cis_log_group.name
  alarm_actions = [aws_sns_topic.myasg_sns_topic.arn]
  tags = local.common_tags
}



