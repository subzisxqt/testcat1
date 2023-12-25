resource "aws_vpc" "cat1" {
  cidr_block = "192.168.0.0/16"
}
resource "aws_subnet" "fancysubnet" {
    vpc_id = aws_vpc.cat1.id
    cidr_block = "192.168.0.0/24"
    availability_zone = "eu-west-1a"
}

resource "aws_security_group" "securegroup1" {
  name = "securesecuregroup"
  vpc_id = aws_vpc.cat1.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"

  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "serverofcat" {
  ami = "ami-02cad064a29d4550c"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.fancysubnet.id
  security_groups = [aws_security_group.securegroup1.id]
}
