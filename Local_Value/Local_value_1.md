```
provider  "aws" {
  region = "REGION_NAME"
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
}

Locals = {
    common_tag = {
     Name = "UK_PROJECT"
     Owner = "swapon"
    }
  }


resource "aws_instance" "web" {
  ami           ="ami_image"
  instance_type = "t3.micro"
  tags          = local.common_tag
}


resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags          = local.common_tag
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-west-2a"
  size              = 40
  tags          = local.common_tag
}
```
