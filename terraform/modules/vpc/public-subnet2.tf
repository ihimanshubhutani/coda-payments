# Creating Public subnet!
resource "aws_subnet" "public-subnet2" {
  depends_on = [
    aws_vpc.vpc-network
  ]
  
  # VPC in which subnet has to be created!
  vpc_id = aws_vpc.vpc-network.id
  
  # IP Range of this subnet
  cidr_block = "192.168.3.0/24"
  
  # Data Center of this subnet.
  availability_zone = var.availability_zone2
  
  # Enabling automatic public IP assignment on instance launch!
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet2.${var.application}.${var.environment}.coda-payment-test-task"
    "kubernetes.io/cluster/coda-payment-rest-api-dev2" = "shared"
    "kubernetes.io/role/elb" = 1
  }
}
