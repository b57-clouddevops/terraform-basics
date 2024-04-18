data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = "DevOps-LabImage-Centos-8"
  owners           = ["355449129696"]
}

# Defining the resources 
resource "aws_instance" "checker" {
  ami                       = data.aws_ami.ami.id 
  instance_type             = var.instance_type
  
  tags = {
    Name = var.component
  }
}

