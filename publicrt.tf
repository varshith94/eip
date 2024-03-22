resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.prod.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod-igw.id
  }
  tags = {
    Name = "${var.vpc_name}-publicrt"
  }
}
resource "aws_route_table_association" "publicassociate" {
  count          = 3
  subnet_id      = element(aws_subnet.publicsubnets.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id

}