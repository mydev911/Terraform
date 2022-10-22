```
provider  "aws" {
  region = "REGION_NAME"
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
}
```
#### Create variable "instancetype"

```
variable instancetype{
  type = map
  default = {
  "dev" = "t2.small", # user '/comma to understand this is next"
  "test" = "t2.medium",
  "prod" = "t2.large"
  }
}
```
#### Create variable "image"
```
variable image {
  type = list
  default = ["IMAGE_AMI_1","IMAGE_AMI_2","IMAGE_AMI_3"]
}
```
#### Create variable "input"
```
variable input {}
```
#### Create resource group
- If input is semiller to dev then create "1" instance , otherwise "0" instance
```
resource "aws_instance" "dev" {
  instance_type = var.instancetype["dev"]
  ami = var.image[0]
  count = var.input == "dev" ? 1 : 0 
  
  tag = {
    Name = "Dev-Department"
  }
 }
