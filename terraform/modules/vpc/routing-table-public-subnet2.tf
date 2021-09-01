# Creating a resource for the Route Table Association!
resource "aws_route_table_association" "internet-gateway2-route-association" {

  depends_on = [
    aws_vpc.vpc-network,
    aws_subnet.public-subnet2,
    aws_subnet.private-subnet2,
    aws_route_table.internet-gateway-route
  ]

# Public Subnet ID
  subnet_id      = aws_subnet.public-subnet2.id

#  Route Table ID
  route_table_id = aws_route_table.internet-gateway-route.id
}
