#Question: Write a Terraform configuration to create two EC2 instances with a load balancer in AWS.
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
  tags = {
    Name = "web-instance-${count.index}"
  }
}

resource "aws_elb" "web_lb" {
  name               = "web-load-balancer"
  availability_zones = ["us-west-2a", "us-west-2b"]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  instances = aws_instance.web.*.id
}
#Key Concepts: Resources, count meta-argument, ELB configuration.
