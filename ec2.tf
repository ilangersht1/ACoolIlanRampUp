resource "aws_network_interface" "ilan-network-interface" {
  count           = var.deploy_count
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.sg-ilan.id]
}

resource "aws_instance" "ilan-instance" {
  count         = var.deploy_count
  ami           = data.aws_ami.rempup_ami_version.id
  instance_type = "t2.medium"
  key_name      = "ilan-keypair"

  network_interface {
    network_interface_id = aws_network_interface.ilan-network-interface[count.index].id
    device_index         = 0
  }
  tags = {
    Name   = "iLan-instance"
  }
}