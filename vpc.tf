resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16" # my personal preference is to never use 10.0.0.0/8 in AWS.. probably an old concern but all EC2 classic is over this subnet.
  tags = {
    Owner  = "iLan" # best to move to default_tags
    Delete = "True"
  }
}

# Create the Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Owner  = "iLan" # best to move to default_tags
    Delete = "True"
  }
}

# Create the public subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24" # Nice exercise would be to generate this from the VPC cidr and maybe even get the count of subnets as a variable
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a" # if subnet count given as a variable you will need to query available AZs and choose from them
  tags = {
    Owner  = "iLan" # best to move to default_tags
    Delete = "True"
  }
}

# Create the private subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Owner  = "iLan" # best to move to default_tags
    Delete = "True"
  }
}

# Create the public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Owner  = "iLan" # best to move to default_tags
    Delete = "True"
  }
}

# Create the private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Owner  = "iLan" # best to move to default_tags
    Delete = "True"
  }
}

# Associate the public subnet with the public route table
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Associate the private subnet with the private route table
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}