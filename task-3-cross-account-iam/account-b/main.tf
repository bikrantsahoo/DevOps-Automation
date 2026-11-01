data "aws_iam_policy_document" "role_c_trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [var.account_a_role_b_arn]
    }
  }
}

resource "aws_iam_role" "role_c" {
  name               = "roleC"
  assume_role_policy = data.aws_iam_policy_document.role_c_trust.json
}

data "aws_iam_policy_document" "role_c_s3" {
  statement {
    sid    = "BucketLevelPermissions"
    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:GetBucketLocation"
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}"
    ]
  }

  statement {
    sid    = "ObjectLevelPermissions"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:AbortMultipartUpload",
      "s3:ListMultipartUploadParts"
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
  }
}

resource "aws_iam_role_policy" "role_c_s3" {
  name   = "roleC-s3-access"
  role   = aws_iam_role.role_c.id
  policy = data.aws_iam_policy_document.role_c_s3.json
}

output "role_c_arn" {
  value = aws_iam_role.role_c.arn
}
