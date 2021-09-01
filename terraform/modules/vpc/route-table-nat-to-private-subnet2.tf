# Creating an Route Table Association of the NAT Gateway route 
# table with the Private Subnet!
resource "aws_route_table_association" "nat-gateway-route-association2" {
  depends_on = [
    aws_route_table.nat-gateway2-route
  ]

#  Private Subnet ID for adding this route table to the DHCP server of Private subnet!
  subnet_id      = aws_subnet.private-subnet2.id

# Route Table ID
  route_table_id = aws_route_table.nat-gateway2-route.id
}
