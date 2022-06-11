# AutoScaling with Lauch Configuration 

module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "4.0.0"
  name = "${local.name}-myasg1"
  use_name_prefix = false

  # ASG Lifecycle Hooks
  initial_lifecycle_hooks = [
    {
      name                 = "ExampleStartupLifeCycleHook"
      default_result       = "CONTINUE"
      heartbeat_timeout    = 60
      lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"
      # This could be a rendered data resource
      notification_metadata = jsonencode({ "hello" = "world" })
    },
    {
      name                 = "ExampleTerminationLifeCycleHook"
      default_result       = "CONTINUE"
      heartbeat_timeout    = 180
      lifecycle_transition = "autoscaling:EC2_INSTANCE_TERMINATING"
      # This could be a rendered data resource
      notification_metadata = jsonencode({ "goodbye" = "world" })
    }
  ]


# ASG Launch configuration
  lc_name   = "${local.name}-mylc1"
  use_lc    = true
  create_lc = true

  min_size                  = 2
  max_size                  = 4
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = module.vpc.private_subnets
  service_linked_role_arn   = aws_iam_service_linked_role.autoscaling-myasg.arn
  
  # Associate ALB with ASG
  target_group_arns         = module.nlb.target_group_arns

  image_id          = data.aws_ami.amz_linux2.id
  instance_type     = var.instance_type
  key_name          = var.instance_keypair
  user_data         = file("${path.module}/myec2app1-install.sh")
  ebs_optimized     = true
  enable_monitoring = true

  security_groups             = [module.private_security-group.security_group_id]  #Associate private_sg to it
  associate_public_ip_address = false
  
  # ASG Instance Referesh
  instance_refresh = {
    strategy = "Rolling"
    preferences = {
      min_healthy_percentage = 50
    }
    triggers = ["tag", "desired_capacity"] # Desired Capacity here added for demostrating the Instance Refresh scenario
  }


  # Add Spot Instances, which creates Spot Requests to get instances at the price listed (Optional argument)
  #spot_price        = "0.014"
  #spot_price        = "0.015" # Change for Instance Refresh test

  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 8
        volume_type           = "gp2"
      }
      }, {
      device_name = "/dev/sda1"
      no_device   = 1
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 10
        volume_type           = "gp2"
      }
    }
  ]
#Meta data launch config Http Options
  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "optional" # At production grade you can change to "required", for our example if is optional we can get the content in metadata.html
    http_put_response_hop_limit = 32
  }

  tags          = local.asg_tags 
}