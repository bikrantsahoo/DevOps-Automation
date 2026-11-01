resource "aws_iam_policy" "ci_pipeline" {
  name        = var.policy_name
  description = "Least privilege permissions for CI/CD deployment"

  policy = file("${path.module}/ci-policy.json")
}

resource "aws_iam_user_policy_attachment" "ci_pipeline" {
  user       = "ci"
  policy_arn = aws_iam_policy.ci_pipeline.arn
}
