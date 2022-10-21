## Terraform variable

* `main/resource.tf` - call modules, locals, and data sources to create all resources
* `variables.tf` - contains declarations of variables used in `main.tf`
* `value.tfvars` - put value inside this file... we are not put value on variable file
* `outputs.tf` - contains outputs from the resources created in `main.tf`
* `versions.tf` - contains version requirements for Terraform and providers

### Create variable file
* `variable file and resource file in same folder`
* `we do not have to define varibale location on resource. terraform will pick it up automatically` 

#### Pre-define value in variable
```
variable "instancetype" {
     default = "t2.micro"
}
```
```
variable "image" {
     default = "image_AMI"
}
```
\
#### Put value when run terraform file
```
variable "instancetype" {
}
```
```
variable "image" {
}
```
#### Put value in different file
### file extention -- tfvars
Create a file
```
vim file_Name.tfvars
```
#### Put value in value file
```
instancetype="t2.micro"
image="image_AMI"
```
### Put value from terminal
```
terraform plan -var="instancetype=t2.nano" -var="image=AWS_IMAGE"
```

## We can setup value in ENVIROMENT VARIALBLE.. 
```
vim .bashrc
```
```
export TF_VAR_instancetype=m2.nano
export TF_VAR_image=AWS_IMAGE
```




