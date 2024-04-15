
# Defining the resources 
resource "aws_instance" "web" {
  ami           = "ami-072983368f2a6eab5"
  instance_type = "t3.micro"


  tags = {
    Name = "tf-instance-backend"
  }
}

# Printing the output
output "private_ip_address" {
    value = aws_instance.app.private_ip
}
