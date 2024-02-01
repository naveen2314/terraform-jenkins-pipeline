provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "foo" {
  ami           = "ami-05fa00d4c63e32376" # us-west-2
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}

#this is for adding backend statefile. New addintion after webhook.New fmt stage
terraform {
  backend "s3" {
    bucket = "iac-pipeline-backend"
    key    = "first-pipeline"
    region = "us-east-1"
  }
}
