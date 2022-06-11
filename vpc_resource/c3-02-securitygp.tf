
resource "aws_security_group" "my_public_sg" {
  name = "my-public-sg1"
  description = "All all http traffic ingress and all outbound traffic"
  vpc_id = aws_vpc.c2m_vpc.id
  ingress  {
    cidr_blocks = [aws_vpc.c2m_vpc.cidr_block]
    description = "The allow http traffic on port 80"
    from_port = 80
    protocol = "tcp"
    to_port = 80
  } 


ingress  {
    cidr_blocks = ["0.0.0.0/0"]
    description = "This is ssh from port 22"
    from_port = 22
    protocol = "tcp"
    to_port = 22
  } 

 egress {
  cidr_blocks = [ "0.0.0.0/0" ]
    description = "The allow all traffic on all port"
    from_port = 0
    protocol = "-1"
    to_port = 0

 }
   tags = {
       Name = "My-http-public-sg"
   }
}

