# Security Group  ( This is how we can run the dynamic block using forLoop )
resource "aws_security_group" "allow_tls" {
  name        = "b57_allow_ssh"
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
    Name = "allow_ssh_sg"
    bu       = local.bu
    manager  = local.manager
    director = local.director
    cost     = local.cost
  }
}




# Security Group  ( This is how we can run the dynamic block using forLoop )
resource "aws_security_group" "allow_app" {
  name        = "b57_allow_app"
  description = "Allow App inbound traffic and all outbound traffic"

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
    Name = "app_ssh_sg"
    bu       = local.bu
    manager  = local.manager
    director = local.director
    cost     = local.cost
  }
}