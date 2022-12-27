resource "aws_security_group" "sg-ilan" {
  name   = "ilan cool SG"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] # this will trigger alert when running tfsec and can be ignored by using #tfsec:ignore:AWS006
    ipv6_cidr_blocks = ["::/0"]      # same
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Owner  = "iLan" # best to move to default_tags
    Delete = "True"
  }
}
