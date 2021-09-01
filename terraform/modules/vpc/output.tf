output vpc-id {
    value = aws_vpc.vpc-network.id
}

output private-subnet1-id {
    value = aws_subnet.private-subnet1.id
}

output private-subnet2-id {
    value = aws_subnet.private-subnet2.id
}

output public-subnet-id {
    value = aws_subnet.public-subnet.id
}

output public-subnet2-id {
    value = aws_subnet.public-subnet2.id
}
