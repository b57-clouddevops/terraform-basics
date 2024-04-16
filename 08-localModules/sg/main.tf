# Creates Security Group 
resource "aws_security_group" "allow_tls" {
  name        = "b57_allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_sg"
  }
}

output "sg" {
    value  = aws_security_group.allow_tls.id 
}