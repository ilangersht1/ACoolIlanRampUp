data "aws_ami" "rempup_ami_version" {
  owners = ["amazon"]
  filter {
    name   = "image-id"
    values = ["ami-09c5ba4f838d8684a"]
  }
}