provider "aws" {}

resource "aws_instance" "web" {
  ami           = "ami-072983368f2a6eab5"
  instance_type = "t2.micro"

  tags = {
    Name = "tf-instance"
  }
}

output "private_ip_address" {
    value = aws_instance.web.private_ip
}