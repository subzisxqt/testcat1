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
    cidr_blocks = ["0.0.0.0/0"]

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
  user_data = <<-EOF
    #!/bin/bash
    sudo dnf update
    sudo dnf install -y docker
    sudo systemctl enable --now docker
    
    # mkdir downloads
    # curl -LO www.website.lt/javaapp.java downloads/
    # docker run nginx -p 80:80 -v ./downloads:/srv
  EOF
  associate_public_ip_address = true
  key_name = aws_key_pair.keys1.key_name

}
resource "aws_key_pair" "keys1" {
  key_name="keys1"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBNiAR99NcnW5opAFp2tYmsUkH3yDWUpn3ujoE8T1Zat catco@catco"
}

# resource "docker_image" "nginx" {
#   name = "nginx"
# }

# resource "docker_container" "nginx" {
#   name = "cat1"
# 	image = docker_image.nginx.image_id
# 	ports {
# 		internal = 80
# 		external = 8000
# 	}
# }



