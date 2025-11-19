resource "aws_iam_role" "frontend_role" {
  name = format(local.resourse_name, "frontend_role")

  # Define the assume role policy, allowing EC2 instances to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = merge(local.common_tags, { "Name" = format(local.resourse_name, "frontend_role") })
}

resource "aws_iam_role_policy_attachment" "ssm_access" {
  role       = aws_iam_role.frontend_role.name
  policy_arn = var.ssm_access_policy_arn
}

# Create an instance profile if the role is for an EC2 instance
resource "aws_iam_instance_profile" "frontend_profile" {
  name = format(local.resourse_name, "frontend_profile")
  role = aws_iam_role.frontend_role.name
}

resource "aws_iam_role" "database_role" {
  name = format(local.resourse_name, "database_role")

  # Define the assume role policy, allowing EC2 instances to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  tags = merge(local.common_tags, { "Name" = format(local.resourse_name, "database_role") })
}

resource "aws_iam_role_policy_attachment" "database_ssm_access" {
  role       = aws_iam_role.database_role.name
  policy_arn = var.ssm_access_policy_arn
}

resource "aws_iam_instance_profile" "database_profile" {
  name = format(local.resourse_name, "database_profile")
  role = aws_iam_role.database_role.name
}