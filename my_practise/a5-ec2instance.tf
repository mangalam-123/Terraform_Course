
//data.aws_availability_zones.my_azones.names----> list values
resource "aws_instance" "DEV" {
    ami = data.aws_ami.amz-ami.id
    //instance_type = var.instance_type   # for normal variable
    instance_type = var.instance_type_list[1] # for list variable
    //instance_type = var.instance_type_map["dev"] # for the map variable
    user_data = file("${path.module}/app2-install.sh")
    vpc_security_group_ids= [aws_security_group.new-web.id, aws_security_group.new-ssh.id]
    key_name = var.instance_keypair
    //for_each = toset(data.aws_availability_zones.my_azones.names)  // for_each takes map or set of string hence toset converts dataa.aws_ava into string
    for_each = toset(keys({for az, details in data.aws_ec2_instance_type_offerings.my-inst-type : az => details.instance_types if length(details.instance_types)!=0}))
    availability_zone = each.key /// for toset each.key==each.value both are same but not in case of maps

    //count = 3 //meta-argument
    tags = {
        "Name" = "my_dev_env -${each.value}"
    }
} 