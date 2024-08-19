resource "aws_iam_policy" "eic_endpoint_user_iam_policy" {
  name = "eic_endpoint_user_iam_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Action": [
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceConnectEndpoints"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Sid": "SSHPublicKey",
        "Effect": "Allow",
        "Action": "ec2-instance-connect:SendSSHPublicKey",
        "Resource": "*",
      },
      {
        "Sid": "EC2InstanceConnect",
        "Action": "ec2-instance-connect:OpenTunnel",
        "Effect": "Allow",
        "Resource": "arn:aws:ec2:${var.aws_region}:${var.account_id}:instance-connect-endpoint/*"
      },
    ]
  })
}