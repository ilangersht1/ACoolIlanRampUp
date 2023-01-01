resource "aws_eip" "lb" {
  vpc      = true
  count    = var.deploy_count
}

resource "aws_eip_association" "eip_assoc" {
  count         = var.deploy_count
  allocation_id = aws_eip.lb[count.index].id
  instance_id   = aws_instance.ilan-instance[count.index].id
}