resource "aws_instance" "web" {
  count           = length(var.subnets_cidr)
  ami             = var.web_ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web.id]
  subnet_id       = element(aws_subnet.my_subnet_public.*.id, count.index)
  user_data       = file("install_httpd.sh")

  tags = {
    #Name = "my_terra_project"
    Name = "Web-${count.index + 1}"
  }
}

resource "aws_key_pair" "my_key" {
  key_name   = "my_key"
  public_key = file("../../.ssh/id_rsa.pub")
}

output "ec2_pub_ip" {
  value = aws_instance.web.*.public_ip
}
