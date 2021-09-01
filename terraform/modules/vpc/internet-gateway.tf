# Creating an Internet Gateway for the VPC
resource "aws_internet_gateway" "internet-gateway" {
  depends_on = [
    aws_vpc.vpc-network,
    aws_subnet.public-subnet,
    aws_subnet.private-subnet1
  ]
  
  # VPC in which it has to be created!
  vpc_id = aws_vpc.vpc-network.id

  tags = {
    Name = "internet-gateway.${var.application}.${var.environment}.coda-payment-test-task"
  }
}