resource "aws_network_interface" "ilan-network-interface" {
  subnet_id   = aws_subnet.public.id
  private_ips = ["10.0.1.100"]
  security_groups = [aws_security_group.sg-ilan.id]

  tags = {
    Owner  = "iLan"
    Delete = "True"
  }
}

resource "aws_instance" "ilan-instance" {
  ami           = "ami-0a261c0e5f51090b1"
  instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.ilan-network-interface.id
    device_index         = 0
  }

  tags = {
    Owner  = "iLan"
    Delete = "True"
    Name   = "iLan-instance"
  }

}