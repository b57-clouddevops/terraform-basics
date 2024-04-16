# This is the root Module :
# root module is nothing but the place where you run the terraform commands 

module "ec2" {
  source = "./ec2"
  sg     = module.sg.sg   # ( sgid : is the name of the output mentioned in sg/)
}


module "sg" {
  source = "./sg"
}