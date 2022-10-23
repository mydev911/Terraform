## tfstate file store on aws s3

https://developer.hashicorp.com/terraform/language/settings/backends/s3

### Store tfstate file on aws s3 bucket and matadate on dynamodb
```
terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "path/to/my/key"
    region = "us-east-1"
    access_key = ""
    secret_key = ""
    dynamodb_table = ""
  }
}
```

### Create a ec2 instance and Store tfstate file on aws s3 bucket and matadate on dynamodb (locking)
- Create a bucket
```
provider "aws" {
  region     = "us-east-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

terraform {
  backend "s3" {
    bucket = "terraformbucketalow"
    key    = "terraformbucketalow/terraformbucket"
    region = "us-east-1"
    access_key = "my-access-key"
    secret_key = "my-secret-key"
    dynamodb_table = "AlowDynamo"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
```
