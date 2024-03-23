resource "aws_route_table" "privatert" {
  vpc_id = aws_vpc.prod.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
  }
  tags = {
    Name = "${var.vpc_name}-ngw"
  }

}
resource "aws_route_table_association" "privateassociate" {
  count          = 3
  subnet_id      = element(aws_subnet.privatesubnets.*.id,count.index)
  route_table_id = aws_route_table.privatert.id

}