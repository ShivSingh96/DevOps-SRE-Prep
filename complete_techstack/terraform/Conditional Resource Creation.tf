#Scenario: Create an AWS EC2 instance only if a specific environment variable (DEPLOY_INSTANCE) is set to true. Use conditional logic in Terraform to implement this.
variable "deploy_instance" {
  type    = bool
  default = false
}

resource "aws_instance" "web" {
  count         = var.deploy_instance ? 1 : 0
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "conditional-instance"
  }
}

output "instance_id" {
  value = aws_instance.web.*.id
  description = "List of instance IDs created"
}
#Key Concepts: Conditional resource creation, count, toggling based on variables.
