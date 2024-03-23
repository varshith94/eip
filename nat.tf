# resource "aws_nat_gateway" "gw" {
#   allocation_id = aws_eip.lb.id
#   subnet_id     = aws_subnet.publicsubnets[0].id
#   tags = {
#     Name = "gw NAT"
#   }
# }