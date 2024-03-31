provider "aws" {
  region = "us-west-1"  # Default region
}

resource "aws_instance" "instance_us_west_1" {
  ami           = "ami-0c55b159cbfafe1f0"  # Example AMI ID (Amazon Linux 2)
  instance_type = "t2.micro"
  tags = {
    Name = "instance-us-west-1"
  }
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_instance" "instance_us_east_1" {
  provider      = aws.us_east_1
  ami           = "ami-0c55b159cbfafe1f0"  # Example AMI ID (Amazon Linux 2)
  instance_type = "t2.micro"
  tags = {
    Name = "instance-us-east-1"
  }
}
