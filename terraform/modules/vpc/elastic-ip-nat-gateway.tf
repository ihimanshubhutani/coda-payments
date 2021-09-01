# Creating an Elastic IP for the NAT Gateway!
resource "aws_eip" "nat-gateway-eip" {
  depends_on = [
    aws_route_table_association.internet-gateway-route-association
  ]
  tags = {
    Name = "nat-gateway-eip.${var.application}.${var.environment}.coda-payment-test-task"
  }
  vpc = true
}
