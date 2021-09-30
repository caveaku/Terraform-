provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAX53EWVBGJAEVN6MU"
  secret_key = "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"

}

resource "aws_instance" "web" {
  ami           = "ami-087c17d1fe0178315"
  instance_type = "t2.micro"

  tags = {
    Name = "web"
  }
}

resource "aws_vpc" "seanvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "seanvpc"
  }
}

resource "aws_internet_gateway" "seanIGW" {
  vpc_id = aws_vpc.seanvpc.id

  tags = {
    Name = "seanIGW"
  }
}

resource "aws_subnet" "pubsubnet" {
  vpc_id     = aws_vpc.seanvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "pubsubnet"
  }
}
