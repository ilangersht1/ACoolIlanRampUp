resource "aws_network_interface" "ilan-network-interface" {
  count = 2
  subnet_id   = aws_subnet.public.id
  security_groups = [aws_security_group.sg-ilan.id]

  tags = {
    Owner  = "iLan"
    Delete = "True"
  }
}

resource "aws_instance" "ilan-instance" {
  ami           = "ami-09c5ba4f838d8684a"
  instance_type = "t2.medium"
  key_name = "ilan-keypair"
  network_interface {
    network_interface_id = aws_network_interface.ilan-network-interface[count.index].id
    device_index         = 0
  }
  count = 2
  tags = {
    Owner  = "iLan"
    Delete = "True"
    Name   = "iLan-instance"
  }
}