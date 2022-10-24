## Create Apache Web Server in AWS Using Terraform
- create ssh-keygen https://www.redhat.com/sysadmin/configure-ssh-keygen#:~:text=By%20default%2C%20your%20private%20and,pub%20files%2C%20respectively.
- root > create folder > 
- create file (aws.tf) and Create index.html (write someting) and create ssh-keygen
- Create ssk-keygen Name- devloper
- Source folder = /aws/index.html  (source) pwd
- Destination folder =  /tmp/index.html --- tmp folder (any other file is not support)
- Create connection between working ec2 instance and provisoned ec2 instancce

```
provider "aws" {
  region     = "us-east-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
resource "aws_key_pair" "devloper" {
  key_name    = "devloper"
  public_key  = "PUBLIC_KeY"
}
resource "aws_instance" "web" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
  key_name      = "devloper"

  tags = {
    Name = "swapon"
  }

provisioner "file" {
    source      = "/aws/index.html"
    destination = "/tmp/index.html"
  }

 provisioner "remote-exec" {
   inline = [
       "sudo yum install httpd -y",
       "sudo systemctl start httpd",
       "sudo systemctl enable httpd",
       "sudo cp /tmp/index.html  /var/www/html",
       "sudo systemctl restart httpd"
   ]
  }

connection {
    host = self.public_ip
    user = "ec2-user"
    type = "ssh"
    private_key = file("./devloper")
 }

}

```
