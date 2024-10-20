resource "aws_instance" "this" {
  ami                     = local.instance_ami
  instance_type           = var.instance-type
   
}

resource "aws_instance" "import" {
  ami                     = local.instance_ami
  instance_type           = var.instance-type
   tags = {
    Name = var.tag2
  }
}