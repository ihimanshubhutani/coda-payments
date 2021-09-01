# Creating a VPC!
resource "aws_vpc" "vpc-network" {

  # IP Range for the VPC
  cidr_block = "192.168.0.0/16"


}
