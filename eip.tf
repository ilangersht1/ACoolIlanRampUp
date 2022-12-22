resource "aws_eip" "lb" {
  instance = aws_instance.ilan-instance.id
  vpc      = true
  tags = {
    Owner  = "iLan"
    Delete = "True"
  }
}