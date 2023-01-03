data "aws_ami" "rempup_ami_version" {
  owners = ["amazon"]
  filter {
    name   = "image-id"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}