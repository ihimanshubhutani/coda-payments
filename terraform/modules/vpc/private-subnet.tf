# Creating Public subnet!
resource "aws_subnet" "private-subnet1" {
  depends_on = [
    aws_vpc.vpc-network,
    aws_subnet.public-subnet
  ]
  
  # VPC in which subnet has to be created!
  vpc_id = aws_vpc.vpc-network.id
  
  # IP Range of this subnet
  cidr_block = "192.168.1.0/24"
  
  # Data Center of this subnet.
  availability_zone = var.availability_zone2
  
  tags = {
    Name = "private-subnet1.${var.application}.${var.environment}.coda-payment-test-task"
    "kubernetes.io/cluster/coda-payment-rest-api-dev2" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}