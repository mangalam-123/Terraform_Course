
resource "aws_instance" "my_new_instance" {
depends_on = [
  aws_vpc.c2m_vpc
]
  #name = "my-newc2m"
  ami = data.aws_ami.amz_linux2.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_public_sg.id]
  subnet_id = aws_subnet.public_subnet[0].id
  availability_zone = element(var.vpc_availability_zone, 0)
  user_data = file("${path.module}/c2m-1-install.sh")
  key_name = var.instance_key

}
