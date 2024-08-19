variable account_id {
  type = string
}

variable aws_region {
  type = string
}

variable ec2_instance_cidr {
  type    = string
  default = "10.0.1.0/24"
}