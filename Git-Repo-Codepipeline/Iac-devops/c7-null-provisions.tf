
resource "null_resource" "name" {
    depends_on = [
      module.ec2-instance_bastion
    ]
connection {
    type = "ssh"
    host = aws_eip.Public_host.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private1-key/terraform-key.pem")
  }

  provisioner "file" {
      source = "private1-key/terraform-key.pem"
      destination = "/tmp/terraform-key.pem"
    
  }

  provisioner "remote-exec" {
      inline = [
        "sudo chmod 400 /tmp/terraform-key.pem"
      ]
    
  }


/*
  provisioner "local-exec" {
 command = "sleep 10"
}

*/

}