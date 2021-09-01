resource "aws_security_group" "allow-http-ssh-ping-sg" {

  depends_on = [
    aws_vpc.vpc-network,
    aws_subnet.public-subnet,
    aws_subnet.private-subnet1
  ]

  description = "HTTP, PING, SSH"

  name = "allow-http-ssh-ping-sg.${var.application}.${var.environment}.coda-payment-test-task"
  
  vpc_id = aws_vpc.vpc-network.id

  ingress {
    description = "Allow HTTP port"
    from_port   = 80
    to_port     = 80


    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Ping port"
    from_port   = 0
    to_port     = 0
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "output"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}