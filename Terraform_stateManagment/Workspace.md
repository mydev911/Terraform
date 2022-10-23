## Terraform workspace
 ```
 terraform workspace list
 ```
```
terraform workspace show
```
```
terraform workspace --help
```
```
terraform workspace new WORKSPACE_NAME
```
```
terraform workspace delete WORKSPACE_NAME
````
- Forcefully delete
```
terraform workspace delete --force WORKSPACE_NAME
```

- switch to other workspace
```
terraform workspace select WORKSPACE_NAME
```
## - Create s3 bucket and dynamo table first
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
    dynamodb_table = "dynamodb_TABLE"
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
