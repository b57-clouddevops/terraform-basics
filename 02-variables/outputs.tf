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