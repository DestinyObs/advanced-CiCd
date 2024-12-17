data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "jenkins_master" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  subnet_id              = aws_subnet.main[0].id  # Updated to use the first subnet in the list

  tags = {
    Name = "Jenkins Master"
  }

  depends_on = [aws_vpc.main, aws_subnet.main]
}

resource "aws_instance" "jenkins_agent" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  subnet_id              = aws_subnet.main[1].id  # Updated to use the second subnet in the list

  tags = {
    Name = "Jenkins Agent"
  }

  depends_on = [aws_vpc.main, aws_subnet.main]
}
