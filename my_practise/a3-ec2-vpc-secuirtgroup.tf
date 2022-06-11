

resource "aws_security_group" "new-ssh" {
    name = "new-ssh"
    description = "Allow the ssh protocol"
    ingress{
        description = "allow ssh into the group"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        description = " Allow all the traffic outbounds into ec2"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

resource "aws_security_group" "new-web" {
    name = "new-web"
    description = "Allow the web traffic protocol"
    ingress{
        description = "allow web into the group"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }

    ingress{
        description = "allow web-secure into the group"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        description = " Allow all the traffic outbounds into ec2"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}