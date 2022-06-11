#AutoScaling Resource

resource "aws_autoscaling_group" "my_asg" {
   
    name_prefix = "myasg-"
    desired_capacity = 2
    max_size = 4
    min_size = 2
    vpc_zone_identifier = module.vpc.private_subnets
    target_group_arns = module.alb.target_group_arns

    health_check_type = "EC2"
    health_check_grace_period = 300 #deafult is 300 sec
    
    launch_template {
      id = aws_launch_template.my_launch_template.id
      version = aws_launch_template.my_launch_template.latest_version
    }

    instance_refresh {
      strategy = "Rolling"
      preferences {
        instance_warmup = 120 # deafult grace period is there
        min_healthy_percentage = 100
      }
      triggers = ["desired_capacity"]
    }

tag {
  key =  "Owners"
  value = "Web-one"
  propagate_at_launch = true
}
  
}