variable "instance-type" {
    type = string
    default = "t2.micro"
}

locals {
    instance_ami = "ami-0e8d228ad90af673b"
}

output "my_first_output" {
  description = "Here is the EC2 ID"
  value = aws_instance.this.id
}


variable "tag2" {
  type = string    
}