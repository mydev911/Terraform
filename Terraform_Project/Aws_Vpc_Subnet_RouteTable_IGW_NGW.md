## Aws > Vpc > Subnet > RouteTable > IGW > NGW

Create a folder
```
mkdir vpc_project
```
```
cd vpc_project/
```
Check file
```
ls
```
Create a file
```
vim vpc.tf
```
#### Give user permision and select region
```
provider "aws" {
  region     = "us-east-2"
  access_key = ""
  secret_key = ""
}
```
#### Create Vpc
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
#main is vpc name
```
resource "aws_vpc" "main_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc_tag"
  }
}
```
#### Create Public subnet
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet
```
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public_subnet_tag"
  }
}
```

#### Create Private subnet
```
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private_subnet_tag"
  }
}
```
#### Create Security Group
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
```
resource "aws_security_group" "Security_Group_Name" {
  name        = "Security_Group_Name"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "security_group_tag"
  }
}
```
#### Create Inernet_Gate_Away
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway
```
resource "aws_internet_gateway" "main_vpc_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "igw_tag"
  }
}
```
#### Create route table
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table
```
resource "aws_route_table" "main_vpc_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    
    gateway_id = aws_internet_gateway.main_vpc_igw.id
  }

  tags = {
    Name = "main_vpc_route_table"
  }
}
```
#### Associate route table
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

```
resource "aws_route_table_association" "main_vpc_associate_route_table" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.main_vpc_route_table.id
}
```
#### Create Key pair
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
```
resource "aws_key_pair" "swapon-key-pair" {
  key_name   = "deployer-key"
  public_key = "public-key"
}
```
#### Find key pair
Create duplicate secession.
ssh-keygen
#Give key pair name
```
ls
```
```
vim 
```


#### Create instance on public subnet
```
resource "aws_instance" "first_terraform_instance" {
  ami           = "ami-089a545a9ed9893b6"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id  #Connect instance to public subnet
  vpc_security_group_ids = [aws_security_group.Security_Group_Name.id]
  key_name      = "swapon-key-pair"
  tags = {
    Name = "instance_tag"
  }
}
```
#### Create ip address
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
```
resource "aws_eip" "cloud_ip" {
  instance = aws_instance.first_terraform_instance.id
  vpc      = true
}
```
#### Create instance on private subnet
```
resource "aws_instance" "first_terraform_private_instance" {
  ami           = "ami-089a545a9ed9893b6"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_subnet.id  #Connect instance to public subnet
  vpc_security_group_ids = [aws_security_group.Security_Group_Name.id]
  key_name      = "swapon-key-pair"
  tags = {
    Name = "private_instance_tag"
  }
}
```
#### Create public ip address for private subnet
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
```
resource "aws_eip" "private_cloud_ip" {
  vpc      = true
}
```
#### Create netgetway for private subnet to expose
```
resource "aws_nat_gateway" "private_subnet_instance_NGW" {
  allocation_id = aws_eip.private_cloud_ip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "gw NAT"
  }
```

