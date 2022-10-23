## Get information about ec2 instance you created

### There are two away get value of ec2
- terraform.tstate    ####  when you run terraform apply this file create
- output.value

#### Create ec2 instance
```
provider  "aws" {
  region = "REGION_NAME"
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
}

resource "aws_instance" "web" {
  ami           ="ami_image"
  instance_type = "t3.micro"
  tags          = "TAG_NAME"
}
```
#### Create output variable ( all info )

```
output "instance_info"{
  value = aws_instance.web
}
```

#### output variable ( id only ) 
```
output "instance_info"{
  value = aws_instance.web.id
}
```

#### output multiple variable (  ) 
```
output "instance_info"{
  value = aws_instance.web.id
}
```

https://learn.hashicorp.com/tutorials/terraform/outputs


