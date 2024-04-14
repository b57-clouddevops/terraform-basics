# terraform-basics

This repository is to make sure we place and practice all the needed Terraform basics.


terraform init ( This downloads all the needed plugins that are mentioned in the code )

Ensure you run `init` even if you made small changes on that code.

terraform plan  ( This shows plan on what's going to be created / changed / destroyed )

```
    + : Creation 
    - : Destroyed
   -/+: Deleted and created 
    ~ : Some properties will be changed
```

Terraform is not going to create the infra againt and again. It know the created resources and it only deals if there are changes in the code / in the real infrastructure.



### What will happen if you try to use/print a variable where the value of it is not delcared ?
```
    While running the plan / apply, you will be prompted to do that and it's not recommended. Because, we run things through terraform.

```

Under stand this :
```
output "sample_op" {
    value = var.sample
}

Output is reserved key workd to print something and sample_op here is the name of the output

variable "sample" {
    default = "terraform"
}

variable is a reserved key workd to declare/define variable and sample is the name of the variable


```
