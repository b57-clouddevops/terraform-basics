#variable "sample"  {}   // Declaring an empty variable


variable "sample" {
    default = "terraform"
}
output "sample_op" {
    value = var.sample
}
