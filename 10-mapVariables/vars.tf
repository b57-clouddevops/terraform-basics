# Map Variable [ Map Of Maps ]
variable "COMPONENTS" {
    default = {
        catalogue = {
            instance_type = "t3.micro"
        },
        cart = {
            instance_type = "t2.micro"
        },
        user = {
            instance_type = "t3.medium"
        },
        ratings = {
            instance_type = "t3.micro"
        },
        payment = {
            instance_type = "t3.medium"
        }
    }
}