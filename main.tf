provider "aws" {
region = "ap-south-1"
access_key = "AKIAZUZOHD2I7HNXAEVY"
secret_key = "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"

}

resource "aws_instance" "one" {
ami = "ami-006935d9a6773e4ec"
instance_type = var.instance_type
key_name = "mumbaikey"
vpc_security_group_ids = [aws_security_group.four.id]
tags = {
Name = var.instance_name_1
}
}

resource "aws_instance" "two" {
ami = "ami-006935d9a6773e4ec"
instance_type = var.instance_type
key_name = "mumbaikey"
vpc_security_group_ids = [aws_security_group.four.id]
tags = {
Name = var.instance_name_2
}
}

resource "aws_instance" "three" {
ami = "ami-006935d9a6773e4ec"
instance_type = var.instance_type
key_name = "mumbaikey"
vpc_security_group_ids = [aws_security_group.four.id]
tags = {
Name = var.instance_name_3
}
}

resource "aws_security_group" "four" {
  name = "elb-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

