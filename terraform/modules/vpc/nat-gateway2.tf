# Creating a NAT Gateway!
resource "aws_nat_gateway" "nat-gateway2" {
  depends_on = [
    aws_eip.nat-gateway2-eip
  ]

  # Allocating the Elastic IP to the NAT Gateway!
  allocation_id = aws_eip.nat-gateway2-eip.id
  
  # Associating it in the Public Subnet!
  subnet_id = aws_subnet.public-subnet2.id
  tags = {
    Name = "nat-gateway2.${var.application}.${var.environment}.coda-payment-test-task"
  }
}
