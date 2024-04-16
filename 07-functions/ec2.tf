data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "DevOps-LabImage-Centos-8"
  owners           = ["355449129696"]
}

# Defining the resources 
resource "aws_instance" "checker" {
  ami                       = data.aws_ami.ami.id 
  instance_type             = "t3.micro"
  count                     = 3

  tags = {
    Name = "tf-instance"
  }
}

# Printing the output
output "private_ip" {
    value = aws_instance.checker.private_ip
}

