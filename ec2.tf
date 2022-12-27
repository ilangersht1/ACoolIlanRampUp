resource "aws_network_interface" "ilan-network-interface" {
  count           = 2
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.sg-ilan.id]

  tags = {
    Owner  = "iLan" # best to move to default_tags
    Delete = "True"
  }
}

resource "aws_instance" "ilan-instance" {
  ami           = "ami-09c5ba4f838d8684a" # for exercise, just fetching the AMI ID using `data` block instead of hardcode it.
  instance_type = "t2.medium"             # this is probably better served as a local variable
  # Just for exercise, if you need to commit the key itself to git - we use sops (https://github.com/mozilla/sops) a lot to encrypt sensitive data using KMS keys
  # that are located at AWS or GCP and using terraform sops module to decrypt them at runtime see - https://github.com/redislabsdev/terraform-modules/tree/main/sops
  key_name = "ilan-keypair"
  network_interface {
    network_interface_id = aws_network_interface.ilan-network-interface[count.index].id
    device_index         = 0
  }
  count = 2 # better to have this as the first parameter of the resource
  tags = {
    Owner  = "iLan" # best to move to default_tags
    Delete = "True"
    Name   = "iLan-instance"
  }
}