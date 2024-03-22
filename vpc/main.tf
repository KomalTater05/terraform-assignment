resource "aws_vpc" "main" {
  cidr_block = lookup(var.vpc_cidr_block,terraform.workspace)
  tags = {
    Name = "Vpc_komal"
  }
}

resource "aws_subnet" "main1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = lookup(var.subnet1_cidr_block,terraform.workspace)
  availability_zone = var.subnet1_availability_zone
  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "main2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = lookup(var.subnet2_cidr_block,terraform.workspace)
  availability_zone = var.subnet2_availability_zone
  tags = {
    Name = "subnet2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "route_table_gw" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Route Table"
  }
}
