data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "k8s_node1" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet1.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  user_data = file("userdata.sh")

  tags = {
    Name = "k8s-node-1"
  }
}

resource "aws_instance" "k8s_node2" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet2.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  user_data = file("userdata.sh")

  tags = {
    Name = "k8s-node-2"
  }
}
