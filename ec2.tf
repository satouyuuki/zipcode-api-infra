resource "aws_key_pair" "keypair" {
  key_name   = var.ssh_key_name
  public_key = file("~/.ssh/${var.ssh_key_name}.pub")
}

# security group
resource "aws_security_group" "websg" {
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ec2
resource "aws_instance" "ec2" {
  ami           = "ami-0f27d081df46f326c"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.keypair.id
  vpc_security_group_ids = [aws_security_group.websg.id]
}