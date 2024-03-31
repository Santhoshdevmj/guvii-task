# Define providers for each region
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}

# Create EC2 instances in us-east-1 region
resource "aws_instance" "instance_us_east_1" {
  provider        = aws.us_east_1
  ami             = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
  instance_type   = "t2.micro"
  tags = {
    Name = "nginx-instance-us-east-1"
  }

  # Provisioning script to install Nginx
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo amazon-linux-extras install nginx1.12 -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}

# Create EC2 instances in us-west-2 region
resource "aws_instance" "instance_us_west_2" {
  provider        = aws.us_west_2
  ami             = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
  instance_type   = "t2.micro"
  tags = {
    Name = "nginx-instance-us-west-2"
  }

  # Provisioning script to install Nginx
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo aptinstall nginx-y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}
