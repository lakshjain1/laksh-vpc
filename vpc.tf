resource "aws_vpc" "laksh_vpc" {
  cidr_block = "192.168.0.0/16"
}

resource "aws_subnet" "laksh_public" {
  vpc_id     = aws_vpc.laksh_vpc.id
  cidr_block = "192.168.5.0/24"

  tags = {
    Name = "laksh-public"
  }
}

resource "aws_subnet" "laksh_private" {
  vpc_id     = aws_vpc.laksh_vpc.id
  cidr_block = "192.168.10.0/24"

  tags = {
    Name = "laksh-private"
  }
}

resource "aws_internet_gateway" "laksh_gw" {
  vpc_id = aws_vpc.laksh_vpc.id

  tags = {
    Name = "laksh-igw"
  }
}

resource "aws_route_table" "laksh_rt_public" {
  vpc_id = aws_vpc.laksh_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.laksh_gw.id
  }

  tags = {
    Name = "laksh-rt-private"
  }
}

resource "aws_route_table" "laksh_rt_private" {
  vpc_id = aws_vpc.laksh_vpc.id

  tags = {
    Name = "laksh-rt-private"
  }
}

resource "aws_route_table_association" "laksh_rta_public" {
  subnet_id      = aws_subnet.laksh_public.id
  route_table_id = aws_route_table.laksh_rt_public.id
}

resource "aws_route_table_association" "laksh_rta_private" {
  subnet_id      = aws_subnet.laksh_private.id
  route_table_id = aws_route_table.laksh_rt_private.id
}