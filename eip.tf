resource "aws_eip" "lb" {
  vpc      = true
  tags = {
    Owner  = "iLan"
    Delete = "True"
  }
  count = 2
}

resource "aws_eip_association" "eip_assoc" {
  count = 2
  allocation_id = aws_eip.lb[count.index].id
  instance_id = aws_instance.ilan-instance[count.index].id

}