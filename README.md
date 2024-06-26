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


Note :
    1) You cannot have 2 outputs with the same name
    2) Terraform only support double quotes. Single quotes are not allowed.
    3) Terraform supports Datatypes and by default everything is a string 
        supported data-types :
            1) Strings
            2) Numbers 
            3) Booleans
    4) Strings are always supposed to be enclosed in double-quotes whilst for numbers & booleans, there is no need of it.

    5) terraform supports Dictionary varaible , List Variables , Map Variables 

    6) You can also supply the values of variables in a file called as "terraform.tfvars" and what terraform by default picks this file.
        if you've variables declared in another variables file then "terraform plan --var-file=def.tfvars"


```
output "sample_op" {
    value = var.sample
}

output "sample_op" {
    value = var.ola
}

Invalid

```

### If you've multiples .tf files in a directory and when you run the Terraform init, plan, apply commands how it works ?

    1) terraform first loads all the files in an Alplabetical Order 
    2) It compiles all of them files and then it understands the logic and the order of creation.
    3) Now apply it going to create the infra in an approach that's needed.


It's always recommended to write the infra without hardcoding values that means parameterizing it and supplying the values based on the environment you're provisioning.

### Values of the variables can be sourced from different files and it goes by priority . . . . 


## How to pass a value of a variable from the command line ? By using, -var sample=10

```
    $ terraform init ; terraform plan -var state=Himachal
```

### Variable Precendence : 

Comman line or file.tfvars  >  terraform.auto.tfvars  > terraform.tfvars  > SHELL ENV Variables


#### terraform version vs provider version ?

```
Why do we need to define provider version for terraform

```

### Can we enforce the version of terraform to be used when dealing with provider ?

```
You know aws provider 10.20.40 needs to have a minimum of 1.0.5 terraform version, how can we enforce people to make sure and the terraform commands to fail if they use incorrect terraform version

```


### We would like to create a ec2 instance  by using terraform :

```
    Note :
        1) We are going to run terraform scripts on WORKSTATION
        2) That means workStation has to authenticate with AWS Cloud.
        3) Ensure you've the IAM Role with Admins Permissions attached with WORKSTATION.
```


### What are arguments and attributes in terraform ?

    1) Arguments are the properties that are needed to create infra ( Using these properties we are going to tell the type of infra to be created )

    2) Attributes : These are the properties of the resources that can only the be accessed only once the infrastructure is created.


### What will happen if you run "terraform plan" & "terraform apply" multiples times ?

Is it going to create the resources one more time ? No , because it always refers the state file.


### How terraform works ?

1) All the resources created by terraform will be registered in a file called as STATE FILE in terraform.
2) This statefile contains all the information about the resources created by it.
3) Whenever you do a "TERRAFORM PLAN" , terraform compares your CODE with the STATEFILE and if there are any deviations in relation to the previos infra, terraform marks that as a change and notice that.


### What will happen, I have created the infra using terraform and some changed some properties manually on that console and when you run plan next time, what will happen ? 

    1) If you're terraform, 100% of your actions should only be by terraform.
    2) Manual actions are not entertained.
    3) In this case, if some changes any property manually and if you run the terraform, whatever you've on the code will be the source of truth.
    4) Your manual changes will be erased and the original or the values that are mentioned in the code will only be considered.


### Will "terrafrom apply" only creates the infra ?

    1) No, "terraform apply" can create / destroy / update the resources based on the type of changes that you're making.
    2) So, it's quite important that you need to review the plan 2-3 times along with a peer-review.

Based on the type of changes that you're making 'terraform apply' can create / destroy / update / re-create the infrastructure.


### What is a backend in terraform ?

```
    Backend is nothing but the location where the terraform state file is stored.
    But default, terraform state will be hosted on local machine or on the local-backend.
```

### When you're working in a Team, it's always recommended to keep the STATE centrally, so that everyone in the team can refer and update it.

### Ensure you've a recommended strategy and here are the best practices of placing Terraform remote state :

    1) Ensure your statefile is not a remote-backend 
    2) Make sure that the remote backend is encrypted ( In you're on AWS, use KMS Keys )


    manoj-password   ----- encryptTion ---- xnsheuso ----->  wieovasedrnqvoqijeaasdfqwedfasd

    3) Using Key Management System, generate a key and encrypt the bucket. So that the information is secure and will be security qualified

    4) If you're using S3, ensure versioning is enabled.


#### By the way, what is S3 ?

```
 S3 stands for Simple Secure Storage : This is a object level storage as a solution offered by amazon and which is widely used by companies to store and organize the data and billing is based on the storage utilization
```

### We have placed our state on the top of a remote backend. What will happen if 2 members tries to run the plan or apply at the same time ?

    1) Both of the actions will be executed paralley and it's a quite a back approach.


### How can we place a mechanism, where if some runs the tf and in the meantime if someone in the teams run the TF Apply, the latest apply command should report an ERROR Saying that xyz user is running and you cannot run.

```
We have that feature available if you're using TERRAFORM ENTERPRISE.

But if you're on AWS, you can attach your DYNAMO DB to S3 and can achieve the premium feature for free officially ?

How to do that is something we see in tomorrow's session.
```

#### Problem Statement :

    1) In Teams, it's not recommended that 2 people running the same infra or terraform job pointing the same infra. 
    2) Recommended approach is, if one person is running the terraform , other person has to wait.
    3) How it's supposed to work is, if one person runs and at the same time if someother person tries to run, he should msg saying that STATEFILE is locked by person - x and you need to wait till the completion of that. 
    4) Point-3 is a default Terraform Enterprise Feature ( TFE : Terraform ) 
    5) Even in openSource you can achieve the same by integrating S3 with DynamoDB ( This is exclusive to AWS )
    6) Typically if you're not on AWS Cloud and if you're using Jenkins to run terraform jobs, you can still handle it :

        a) On the Jenkins job, there is an option called as "disableConcurrentBuilds()" , if a job-x is running and if someone tries to run the same job-x at the same time, till the completion of the previous run, it will be in the queue. 


Advantage of using Terraform Remote backend S3 with dynamodb :

```
    This backend also supports state locking and consistency checking via Dynamo DB, which can be enabled by setting the dynamodb_table field to an existing DynamoDB table name. 

    A single DynamoDB table can be used to lock multiple remote state files. 

    Terraform generates key names that include the values of the bucket and key variables.
```


This is how we can configure our backend on s3 to be managed by DynamodDB :
```
terraform {
  backend "s3" {
    bucket              = "b57-tf-state-bucket"
    key                 = "dev/dynamodb/terraform.tfstate"
    region              = "us-east-1"
    dynamodb_table      = "terraform-locking"
  }
}
```

Ensure DynamodDB is created with partition key as "LockID"


From now if more than one parallel run happens, you'd see the below exception through the state-lock mechanism :

```
    │ Error: Error acquiring the state lock
    │
    │ Error message: operation error DynamoDB: PutItem, https response error StatusCode: 400, RequestID: MBR3VFCDA4QLLGD8ILRNG04RD7VV4KQNSO5AEMVJF66Q9ASUAAJG,
    │ ConditionalCheckFailedException: The conditional request failed
    │ Lock Info:
    │   ID:        aed90da9-cc23-7083-df37-2260f902752e
    │   Path:      b57-tf-state-bucket/dev/dynamodb/terraform.tfstate
    │   Operation: OperationTypeApply
    │   Who:       centos@ip-172-31-35-230.ec2.internal
    │   Version:   1.8.0
    │   Created:   2024-04-16 00:56:44.405457629 +0000 UTC
    │   Info:
    │
    │
    │ Terraform acquires a state lock to protect the state from being written
    │ by multiple users at the same time. Please resolve the issue above and try
    │ again. For most commands, you can disable locking with the "-lock=false"
    │ flag, but this is not recommended.
```


### Ingress vs Egress :

```
    Inboubd Traffic is referred as Ingress 
    Outbound Traffic is referred as Egress
```

### In terraform, how can we fetch the details of the resources that are already available on Cloud ( No need to be created by terraform ) ?

```
    Datasource in terraform can helps in fetching the properties of the available resources.
    Based on the type of resource, terraform provides the datasoures.

    Google ---> AWS AMI Datasource Terraform
```


### What's the challenge with list and count ?

```
 With list and count ( 07-functions example ), you can create multiple instances but with the similar properies, but cannot create multiple instances with different properties of your choice.

 In this case, we can go with something called as MAP based object, a map is nothing but a key with multiple key value pairs along with the usage of Module in terraform
```


### What is a module on terraform ?

```
Modules is nothing but a folder in terraform to organize and keep the terraform code dry.

By default, whatever you write is also in a  root module .

The main advantage of dealing Modules to we can reuse the code and that eventually keeps the code 100% dry.

We can write a module for ec2+sg and this can be used by other teams, just by supplying a different set of values, that's the power of modules

```


### How to create dependency or the order of creation in terraform ?

```
This is not always a safe practice, but when you're dealing with resources that are not know to each other and you want to tell terraform that I need to create this resource-x first and then resource-y. In this case you can use "depends_on"

    in resource-y, mentioned "depends_on= resource-x"

```


### In how many ways, can we use make modules in terraform ?

    1) Hashicorp Supplied Modules   ( Don't use them and it's always better to make your own modules )
    2) Make your own module and keep it locally in the same repo ( Local Modules  : Preferred )
    3) Make your own module and keep it on the top of a remote repository ( Rempte Modules : Remote )


### How to pass/print the outputs from backend module to root module ? How to share the data from one module to another ?



### Steps To Pass The Date Between Modules ?

Ref : https://github.com/b57-clouddevops/terraform-basics/tree/main/08-localModules`
    1) If you've 2 modules named ec2/ and sg/
    2) And to pass the sdID in form sg module to ec2/, then declare the sdid as output in the sg/ 
    3) Now supply this as abject in the root folder ( sg = module.sg.sdID)
    4) Now on the ec2/ declare an empty variable as variable "sg" {}
    5) Now this can be referrenced 
 


What's next ?
    1) Dynamic Blocks 
    2) Conditions 
    3) Locals 
    4) Network


for_each, count (count.index) , if_else

IfElse In Terraform : ( Conditional Expression )
        

    ```
            If condition is true then the result is true_val. If condition is false then the result is false_val.

            condition ? true_val : false_val 
            
    ```

### Use Case : If the BU using this script is saas = t3.medium and any other BU apart from saas should go by t3.micro

Outputs in terraform are not just to display information. 
They play a very important role in sharing the data from one module to other module


What is the purpose of Dynamic Blocks In Terraform ?

When to locals in terraform ?

    When you have a similar pattern and would like to use it or call it on need basis you can use locals.

### Provisioners In Terraform

    Provisioners Help You To Run Actions Or Tasks As apart of the terraform.


    Provisioners marjorly are of 4 types :
        1) Local Provisioner  : This is to run some action on the top of the infra you're running terraform commands
        2) Remote Provisioner   : This is to run some action on the top of the infra you're created by terraform
        3) File Provisioner   : This is used to copy something to the newly creaed infra. ( For this connection provision will also be used )
        4) Connection Provisoner  : To perform something on the top of remote machine : on the created machine, first connection should be enabled and this can be enabled by connection-provisioner.

### Pros and Cons of using List vs Maps ? 

How to use Map of Maps ?


The very first thing that you set you in your company when you decid eto start a project is :
    > Building Network 
    > So, it's quite essential you should know how it works and what to be considered before you start the project.

### Internet vs Intranet 

        Internet : Public Network 
        Intranet : Private Network

### Infra Provisioning :

        1) VPC 
        2) DB's
        3) Compute + CM 