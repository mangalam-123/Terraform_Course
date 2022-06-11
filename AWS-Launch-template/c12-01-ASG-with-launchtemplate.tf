# Launch Template Resource Creation

resource "aws_launch_template" "my_launch_template" {
  name = "my-launch-template"
  description = "My Launch base template"
  image_id = data.aws_ami.amz_linux2.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ module.private_security-group.security_group_id ]
  key_name = var.instance_keypair
  
  user_data = filebase64("${path.module}/myec2app-1-install.sh")
  ebs_optimized = true
  #default_version = 1.0
  update_default_version = true
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 10
      delete_on_termination = true
      volume_type = "gp2"
    }
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "myasglt"
    }
  }

}

##Just keep in mind the launch template/Lauch config may not work in may reqion due to the type of ec2-instace ad will give error the requerst config is not valid
