# Declaring the provider information
provider "aws" {}

# Defining the resources 
resource "aws_instance" "app" {
  ami           = "ami-072983368f2a6eab5"
  instance_type = "t3.micro"


  tags = {
    Name = "tf-instance-dev"
  }
}

# Printing the output
output "private_ip_address" {
    value = aws_instance.app.private_ip
}
