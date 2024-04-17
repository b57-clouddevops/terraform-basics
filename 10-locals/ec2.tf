# Defining the resources 
resource "aws_instance" "app" {
  ami                       = "ami-072983368f2a6eab5"
  instance_type             = local.bu == "PAAS" ? "t2.micro" : "t3.medium"
  vpc_security_group_ids    = [aws_security_group.allows_tls.id]


  tags = {
      Name = "tf-instance"
      bu   = local.bu
      mange = local.mange
      cost  = local.cost 
      director = local.director
  }
}

# Printing the output
output "private_ip" {
    value = aws_instance.app.private_ip
}

# Security Group 
resource "aws_security_group" "allows_tls" {
  name        = "b57ing_allow_ssh"
  description = "Allow SSH inbound traffic and all outbound traffic"

  dynamic ingress {
    for_each = var.ingress_rules
        content {
            description     = ingress.value["description"]
            from_port       = ingress.value["from_port"]
            to_port         = ingress.value["to_port"]
            protocol        = ingress.value["protocol"]
            cidr_blocks     = ingress.value["cidr_blocks"]
            }
        }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
      Name = "allowing_ssh_sg"
      bu   = local.bu
      mange = local.mange
      cost  = local.cost 
      director = local.director
  }
}


resource "aws_security_group" "testing_tls" {
  name        = "b57s_allow_ssh"
  description = "Allow Test inbound traffic and all outbound traffic"

  dynamic ingress {
    for_each = var.ingress_rules
        content {
            description     = ingress.value["description"]
            from_port       = ingress.value["from_port"]
            to_port         = ingress.value["to_port"]
            protocol        = ingress.value["protocol"]
            cidr_blocks     = ingress.value["cidr_blocks"]
            }
        }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "testing_sg"
      bu   = local.bu
      mange = local.mange
      cost  = local.cost 
      director = local.director
  }
}