# Security Group for EIC Endpoint
resource "aws_security_group" "eic_endpoint_sg" {
  name   = "eic-endpoint-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "eic_endpoint_sg_rule" {
  security_group_id        = aws_security_group.eic_endpoint_sg.id
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.eic_endpoint_target_sg.id
}

# Security Group for EC2 instances that we need to connect to
resource "aws_security_group" "eic_endpoint_target_sg" {
  name   = "eic-endpoint-target-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    security_groups = [
      aws_security_group.eic_endpoint_sg.id
    ]
  }
}

resource "aws_ec2_instance_connect_endpoint" "ec2_instance_connect_endpoint" {
  subnet_id          = var.ec2_private_subnet
  security_group_ids = [aws_security_group.eic_endpoint_sg.id]
}
