resource "aws_vpc" "project_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "ProjectVPC"
  }
}

resource "aws_subnet" "project_public_subnet" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "project_public_subnet"
  }
}

resource "aws_subnet" "project_private_subnet" {
  vpc_id            = aws_vpc.project_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "project_private_subnet"
  }
}


resource "aws_eip" "vpc_eip" {

  tags = {
    Name = "vpc_eip"
  }
}


resource "aws_internet_gateway" "project_igw" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = "project_igw"
  }
}


resource "aws_nat_gateway" "project_nat_gateway" {
  allocation_id = aws_eip.vpc_eip.id 
  subnet_id     = aws_subnet.project_private_subnet.id

  tags = {
    Name = "project_nat_gateway"
  }
}


resource "aws_route_table" "project_public_rt" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_igw.id
  }

  tags = {
    Name = "project_public_rt"
  }
}


resource "aws_route_table" "project_private_rt" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.project_nat_gateway.id  
  }

  tags = {
    Name = "project_private_rt"
  }
}



resource "aws_route_table_association" "project_public_rta" {
  subnet_id      = aws_subnet.project_public_subnet.id
  route_table_id = aws_route_table.project_public_rt.id
}

resource "aws_route_table_association" "project_private_rta" {
  subnet_id      = aws_subnet.project_private_subnet.id
  route_table_id = aws_route_table.project_private_rt.id
}