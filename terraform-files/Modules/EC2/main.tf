##################################################################################
# DATA
##################################################################################


data "aws_ami" "centos" {
  owners      = ["679593333241"]
  most_recent = true
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

##################################################################################
# RESOURCES
##################################################################################


# SECURITY GROUPS #
# Nginx security group 
resource "aws_security_group" "instance-sg" {
  name   = "${var.instance_name}_sg"
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.prefix}-${var.instance_name}-sg"
  }

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# INSTANCES #
resource "aws_instance" "instance" {
  ami                    = data.aws_ami.centos.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.instance-sg.id]
  key_name               = var.key_name
  tags = {
    Name = "${var.prefix}-${var.instance_name}"
  }
}