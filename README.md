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

