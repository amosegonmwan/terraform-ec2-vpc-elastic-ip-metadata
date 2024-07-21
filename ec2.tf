resource "aws_instance" "frontend" {
  ami                    = data.aws_ami.amz-linux-ami.id
  instance_type          = var.ec2_instance_type
  key_name               = var.keypair_name
  subnet_id              = aws_subnet.project_public_subnet.id
  user_data              = file("app.sh")
  vpc_security_group_ids = [aws_security_group.frontend_sg.id]

  metadata_options {
    http_tokens                 = "optional" # IMDSv2 optional
    http_put_response_hop_limit = 1          # Optional, set the response hop limit
    http_endpoint               = "enabled"  # Optional, can be disabled if needed
  }

  tags = {
    Name = var.instance_tags["front-tier"]
  }
}

# Sleep resource to allow EC2 Bootstrap
resource "time_sleep" "sleep" {
  depends_on = [ aws_instance.frontend ]
  create_duration = "360s"
}

# Elastic IP Attached to EC2 Instance
resource "aws_eip" "lb" {
  instance = aws_instance.frontend.id
  domain   = "vpc"
}


resource "aws_instance" "backend" {
  ami                    = data.aws_ami.amz-linux-ami.id
  instance_type          = var.ec2_instance_type
  key_name               = var.keypair_name
  subnet_id              = aws_subnet.project_private_subnet.id
  vpc_security_group_ids = [aws_security_group.backend_sg.id]

  tags = {
    Name = var.instance_tags["back-tier"]
  }
}
