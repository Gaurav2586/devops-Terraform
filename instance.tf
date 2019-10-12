resource "aws_instance" "public" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-2.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykey.key_name

  tags = {
    Name = "public-instance"
  }
}

resource "aws_instance" "private" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-private-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykey.key_name

  tags = {
    Name = "private-instance"
  }
}
output "public-instance" {
  value = "${aws_instance.public.public_ip}"
}
output "private-instance" {
  value = "${aws_instance.private.private_ip}"
}
output "public-instance-availability-zone" {
  value = "${aws_instance.public.availability_zone}"
}
output "private-instance-availability-zone" {
  value = "${aws_instance.private.availability_zone}"
}
