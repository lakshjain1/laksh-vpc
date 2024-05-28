resource "aws_instance" "laksh" {
    ami = "ami-0f3c7d07486cad139"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.laksh_public.id
    security_groups = [aws_security_group.laksh_SG.id]
    associate_public_ip_address = true
    tags = {
      Name = "Laksh"
    }
}