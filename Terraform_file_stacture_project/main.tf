resource "aws_instance" "first_terraform_private_instance"{
  ami           = var.image
  instance_type = var.instancetype
}
