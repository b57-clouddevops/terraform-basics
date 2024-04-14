#variable "sample"  {}   // Declaring an empty variable


variable "sample" {
    default = "terraform"
}
output "sample_op" {
    value = var.sample
}

output "sampls_op_with_var" {
    value = Value of sample is var.sample 
}