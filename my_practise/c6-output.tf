
/*
output "instance_publicip" {
    description = "THIS IS TO GET THE PUBLIC IP OF MY EC2 INSTANCE"
    value = aws_instance.DEV.public_ip
}


output "instance_publicdns" {
    description = "THIS IS TO GET THE PUBLIC DNS OF MY EC2 INSTANCE"
    value = aws_instance.DEV.public_dns
}
*/
/*
output "for_output_list" {
    description = "THis is for loop for public ip"
    value = [for instance in aws_instance.DEV : instance.public_ip]
}

output "for_output_list1" {
    description = "THis is for loop for public dns"
    value = [for instance in aws_instance.DEV : instance.public_dns]
}

output "for_ouput_map1" {
    description = "THis is for in case of map iteration"
    value = {for instance in aws_instance.DEV : instance.id => instance.public_ip}
}

output "for_ouput_map1a" {
    description = "THis is for in case of map iteration"
    value = {for instance in aws_instance.DEV : instance.id => instance.public_dns}
}


output "for_ouput_map2" {
    description = "THis is for in case of map iteration"
    value = {for c, instance in aws_instance.DEV : c => instance.public_ip}
}

output "for_ouput_splat" {
    description = "THis is for in case of map iteration"
    value = aws_instance.DEV[*].public_ip

}

output "for_ouput_splat1" {
    description = "THis is for in case of map iteration"
    value = aws_instance.DEV[*].public_dns
}

*/

output "my_output_list_ip" {
    description = "List the for loop "
    value = [for instance in aws_instance.DEV : instance.public_ip]
    
  
}

output "my_output_list_dns" {
    description = "List the for loop "
    value = [for instance in aws_instance.DEV : instance.public_dns]
  
}


// aws ec2 describe-instance-type-offerings --location-type availability-zone --filters Name=instance-type,Values=t2.micro --region=ap-south-1