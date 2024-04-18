# This is the root Module :
# root module is nothing but the place where you run the terraform commands 

# Never loop the mainModule ( backendModule ), rather run the localModule

module "ec2" {
  for_each      =  var.COMPONENTS # You're looping against the Map Variable

  source        = "./ec2"
  component     = each.key 
  instance_type = each.value.instance_type
}



