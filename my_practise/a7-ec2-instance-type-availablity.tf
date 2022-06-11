
data "aws_availability_zones" "my_azones"{
    filter {
    name = "opt-in-status"
    values = ["opt-in-not-required"]
    }
}


data "aws_ec2_instance_type_offerings" "my-inst-type" {
    for_each = toset(data.aws_availability_zones.my_azones.names)
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}


output "output_v3" {
    value = keys({for az, details in data.aws_ec2_instance_type_offerings.my-inst-type : az => details.instance_types if length(details.instance_types)!=0})
  
}