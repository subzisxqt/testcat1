terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
        docker = {
        	source = "kreuzwerker/docker"
        	version = "~> 3.0.1"
        }
    }
}

provider "aws" {
    region = "eu-west-1"
  
}

# provider "docker" {
#     host = "ssh://ec2-user@${aws_instance.serverofcat.public_ip}"
#     ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostFile=/dev/null"]
# }


