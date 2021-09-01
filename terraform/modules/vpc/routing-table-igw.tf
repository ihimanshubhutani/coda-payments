# Creating an Route Table for the public subnet!
resource "aws_route_table" "internet-gateway-route" {
  depends_on = [
    aws_vpc.vpc-network,
    aws_internet_gateway.internet-gateway
  ]

   # VPC ID
  vpc_id = aws_vpc.vpc-network.id

  # NAT Rule
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "internet-gateway-route.${var.application}.${var.environment}.coda-payment-test-task"
  }
}