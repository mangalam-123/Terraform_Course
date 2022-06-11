

resource "aws_iam_service_linked_role" "autoscaling-myasg" {
    aws_service_name = "autoscaling.amazonaws.com"
    description = "A service linked role for autoscaling"
    custom_suffix = local.name
  
}

/*
provisioner "local-exec" {
 command = "sleep 10"
}

*/


#Outputs for the IAM service linked Role

output "service_linked_role_arn" {
  value = aws_iam_service_linked_role.autoscaling-myasg.arn
}
