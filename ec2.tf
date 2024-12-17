resource "aws_instance" "jenkins_master" {
  ami                         = var.my_ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  subnet_id                   = aws_subnet.main[0].id
  associate_public_ip_address = true
  key_name                    = "CV-build"  # Replace with your key pair name

  tags = {
    Name = "Jenkins Master"
  }

  depends_on = [aws_vpc.main, aws_subnet.main]
}

resource "aws_instance" "jenkins_agent" {
  ami                         = var.my_ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  subnet_id                   = aws_subnet.main[1].id
  associate_public_ip_address = true
  key_name                    = "CV-build"  # Replace with your key pair name

  tags = {
    Name = "Jenkins Agent"
  }

  depends_on = [aws_vpc.main, aws_subnet.main]
}
