
resource "null_resource" "name" {
    depends_on = [
      module.ec2-instance_bastion
    ]
connection {
    type = "ssh"
    host = aws_eip.Public_host.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private1-key/terraform-key1.pem")
  }

  provisioner "file" {
      source = "private1-key/terraform-key1.pem"
      destination = "/tmp/terraform-key1.pem"
    
  }

  provisioner "remote-exec" {
      inline = [
        "sudo chmod 400 /tmp/terraform-key1.pem"
      ]
    
  }

  provisioner "local-exec" {
      command = "echo This is to get data `data` VPC ID ${module.vpc.vpc_id} >> creation-date-vpc-id.txt"
      working_dir = "local-exec-output-files/"

    
  }
}