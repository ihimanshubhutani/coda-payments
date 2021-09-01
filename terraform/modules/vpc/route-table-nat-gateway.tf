# Creating a Route Table for the Nat Gateway!
resource "aws_route_table" "nat-gateway-route" {
  depends_on = [
    aws_nat_gateway.nat-gateway
  ]

  vpc_id = aws_vpc.vpc-network.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway.id
  }

  tags = {
    Name = "nat-gateway-route.${var.application}.${var.environment}.coda-payment-test-task"
  }

}
