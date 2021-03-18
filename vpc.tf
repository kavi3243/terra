#Creating VPC

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "my_terra_project"
  }
}

# Creating IGW and attach to my_vpc
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my_terra_project"
  }
}

#Create Subnet
resource "aws_subnet" "my_subnet_public" {
  count                   = length(var.subnets_cidr)
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = element(var.subnets_cidr, count.index) #"10.0.1.0/24"
  availability_zone       = element(var.avail_zone, count.index)
  map_public_ip_on_launch = true

  tags = {
    #Name = "my_terra_project"
    Name = "subnet-${count.index + 1}"
  }
}

#creating route tables and attach the IGW
resource "aws_route_table" "pub_route" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    #Name = "my_terra_project"
    Name = "pub_route"
  }
}

#attache route tables with public subnets

resource "aws_route_table_association" "a" {
  count          = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.my_subnet_public.*.id, count.index)
  route_table_id = aws_route_table.pub_route.id
}

