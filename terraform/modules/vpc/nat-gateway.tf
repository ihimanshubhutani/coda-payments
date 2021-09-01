# Creating a NAT Gateway!
resource "aws_nat_gateway" "nat-gateway" {
  depends_on = [
    aws_eip.nat-gateway-eip
  ]

  # Allocating the Elastic IP to the NAT Gateway!
  allocation_id = aws_eip.nat-gateway-eip.id
  
  # Associating it in the Public Subnet!
  subnet_id = aws_subnet.public-subnet.id
  tags = {
    Name = "nat-gateway.${var.application}.${var.environment}.coda-payment-test-task"
  }
}