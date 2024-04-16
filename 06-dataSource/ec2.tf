data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "DevOps-LabImage-Centos-8"
  owners           = ["355449129696"]
}

# Defining the resources 
resource "aws_instance" "ds" {
  ami                       = data.aws_ami.ami.id 
  instance_type             = "t3.micro"

  tags = {
    Name = "tf-instance"
  }
}

# Printing the output
output "private_ip" {
    value = aws_instance.ds.private_ip
}

