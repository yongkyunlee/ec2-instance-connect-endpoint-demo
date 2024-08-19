# Reference: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/permissions-for-ec2-instance-connect-endpoint.html
resource "aws_iam_policy" "eic_endpoint_admin_iam_policy" {
  name = "eic_endpoint_admin_iam_policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Action": [
          "ec2:DescribeNetworkInterfaces",
          "iam:CreateServiceLinkedRole",
          "ec2:CreateNetworkInterface",
          "ec2:CreateTags"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Action": [
          "ec2:CreateInstanceConnectEndpoint",
          "ec2:DeleteInstanceConnectEndpoint"
        ],
        "Effect": "Allow",
        "Resource": [
          "arn:aws:ec2:${var.aws_region}:${var.account_id}:subnet/*",
          "arn:aws:ec2:${var.aws_region}:${var.account_id}:security-group/*",
          "arn:aws:ec2:${var.aws_region}:${var.account_id}:instance-connect-endpoint/*"
        ]
      },
      {
        "Sid": "DescribeInstanceConnectEndpoints",
        "Action": [
          "ec2:DescribeInstanceConnectEndpoints"
        ],
        "Effect": "Allow",
        "Resource": "*"
      },
      {
        "Effect": "Allow",
        "Action": [
          "ec2:CreateSecurityGroup",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeSecurityGroupRules"
        ]
        "Resource": "*"
      },
      {
        "Sid": "DeleteSecurityGroup",
        "Action": [
          "ec2:DeleteSecurityGroup",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupEgress"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  })
}
