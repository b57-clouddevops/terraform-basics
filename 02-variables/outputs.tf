#variable "sample"  {}   // Declaring an empty variable
output "sample_op" {
    value = var.sample
}

output "sampls_op_with_var" {
    value = "Value of sample is ${var.sample}"
}

# When to enclose a variable in Quotes and when to use $ notation for a variable ???
# Whenever your variable is enclosed in a set of strings or in between a sentence, then we to enslose them in strings and with bash notation.

output "batch_number" {
    value = var.batch
}

# Declaring a list variable 
variable "learning_info" {
    default = [
        "DevOps",
        "AWS",
        57
    ]
}

# printing a list variable
output "learning_info_op" {
    value = "Welcome To ${var.learning_info[0]} with ${var.learning_info[1]} Learning and this is our ${var.learning_info[2]}th learning batch"
}

# Declaring a map variable 
variable "learning_map" {
    default = {
        batch = 56
        mode = "online" 
        learning = "DevOpsWithAWS"
    }
}

output "learning_map_op" {
    value = "Welcome To ${var.learning_map["batch"]} th batch and learning mode is ${var.learning_map["mode"]} and it covers ${var.learning_map["learning"]}"
}


# printing city 
variable "city" {}
output "fav_city_name" {
    value = var.city
}

# printing state 
variable "state" {}
output "fav_state_name" {
    value = var.state
}