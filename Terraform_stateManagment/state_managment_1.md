## terraform.tfstate  / terraform.tfstate.backup

```
provider "aws" {
  region     = "us-east-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}


resource "aws_instance" "web" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
```
#### Check
- terraform plan
- terraform apply
- ## terraform.tfstate file create
#### Now change and run apply
- ## terraform.tfstate.backup file create
