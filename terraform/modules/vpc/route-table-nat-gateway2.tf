# Creating a Route Table for the Nat Gateway2!
resource "aws_route_table" "nat-gateway2-route" {
  depends_on = [
    aws_nat_gateway.nat-gateway2
  ]

  vpc_id = aws_vpc.vpc-network.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gateway2.id
  }

  tags = {
    Name = "nat-gateway2-route.${var.application}.${var.environment}.coda-payment-test-task"
  }

}
