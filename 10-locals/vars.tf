variable "ingress_rules" {
    default = [
        {
            description     = "Allows SSH"
            from_port       = 22
            to_port         = 22
            protocol        = "tcp"
            cidr_blocks     = ["0.0.0.0/0"]
        },

        {
            description     = "Allows Apache"
            from_port       = 8080
            to_port         = 8080
            protocol        = "tcp"
            cidr_blocks     = ["171.16.0.0/32"]
        },

        {
            description     = "Allows Nexus"
            from_port       = 8081
            to_port         = 8081
            protocol        = "tcp"
            cidr_blocks     = ["0.0.0.0/0"]
        }
    ]
}