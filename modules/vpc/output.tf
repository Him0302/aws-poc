output "vpc_id"{
    value = aws_vpc.main.id
}

output "private_subnet_id_us_east_1a"{
    value = aws_subnet.private_us_east_1a.id
}

output "private_subnet_id_us_east_1b"{
    value = aws_subnet.private_us_east_1b.id
}

output "public_subnet_id_us_east_1a"{
    value = aws_subnet.public_us_east_1a.id
}

output "public_subnet_id_us_east_1b"{
    value = aws_subnet.public_us_east_1b.id
}


