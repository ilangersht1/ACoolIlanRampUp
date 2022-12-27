# I really don't like the `count = 2` you use to start two instances (affect EIP and eip_assoc, ENI and EC2)
# do you think of any other way that this can be done better?
resource "aws_eip" "lb" {
  vpc = true
  tags = {
    Owner  = "iLan" # best to move to default_tags
    Delete = "True"
  }
  count = 2
}

resource "aws_eip_association" "eip_assoc" {
  count         = 2
  allocation_id = aws_eip.lb[count.index].id
  instance_id   = aws_instance.ilan-instance[count.index].id
}