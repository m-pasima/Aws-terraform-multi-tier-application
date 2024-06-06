resource "aws_eip" "eip_for_nat_gateway_az1" {
  domain = "vpc"

  tags = {
    Name = "eip az1 nat-gateway"
  }
}

resource "aws_eip" "eip_for_nat_gateway_az2" {
  domain = "vpc"

  tags = {
    Name = "eip az2 nat-gateway"
  }
}

resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip_for_nat_gateway_az1.id
  subnet_id     = var.public_subnet_az1_id

  tags = {
    Name = "nat_gateway_az1"
  }

  depends_on = [var.internet_gateway_id]
}

resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.eip_for_nat_gateway_az2.id
  subnet_id     = var.public_subnet_az2_id

  tags = {
    Name = "nat_gateway_az2"
  }

  depends_on = [var.internet_gateway_id]
}

