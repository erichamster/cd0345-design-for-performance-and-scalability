provider "aws" {
  region                  = "us-east-1"
  # shared_credentials_file = "C:/Users/datnt/.aws/credentials"
}

resource "aws_instance" "Udacity_T2" {
  ami           = "ami-09d95fab7fff3776c"
  count         = "4"
  instance_type = "t2.micro"
  subnet_id     = "subnet-028f3598fbccaaae5"
  tags = {
    Name = "Udacity T2"
  }
}

## Commenting to destroy 2 EC2 instances
# resource "aws_instance" "Udacity_M4" {
#   ami           = "ami-09d95fab7fff3776c"
#   count         = "2"
#   instance_type = "m4.large"
#   subnet_id     = "subnet-028f3598fbccaaae5"
#   tags = {
#     Name = "Udacity M4"
#   }
# }