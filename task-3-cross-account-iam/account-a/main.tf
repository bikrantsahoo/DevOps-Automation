# IAM Groups

resource "aws_iam_group" "group1" {
  name = "group1"
}

resource "aws_iam_group" "group2" {
  name = "group2"
}

# IAM Users

resource "aws_iam_user" "engine" {
  name = "engine"
}

resource "aws_iam_user" "ci" {
  name = "ci"
}

resource "aws_iam_user" "alex" {
  name = "alex.admin"
}

resource "aws_iam_user" "sam" {
  name = "sam.ops"
}

# Group 1 Membership

resource "aws_iam_user_group_membership" "group1_members" {
  for_each = {
    engine = aws_iam_user.engine.name
    ci     = aws_iam_user.ci.name
  }

  user   = each.value
  groups = [aws_iam_group.group1.name]
}

# Group 2 Membership

resource "aws_iam_user_group_membership" "group2_members" {
  for_each = {
    alex = aws_iam_user.alex.name
    sam  = aws_iam_user.sam.name
  }

  user   = each.value
  groups = [aws_iam_group.group2.name]
}

# Role A - Administrator access except IAM

data "aws_iam_policy_document" "role_a_policy" {
  statement {
    effect      = "Allow"
    not_actions = ["iam:*"]
    resources   = ["*"]
  }
}

resource "aws_iam_policy" "role_a_policy" {
  name   = "roleA-admin-except-iam"
  policy = data.aws_iam_policy_document.role_a_policy.json
}

data "aws_iam_policy_document" "role_a_trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_a_id}:root"]
    }
  }
}

resource "aws_iam_role" "roleA" {
  name               = "roleA"
  assume_role_policy = data.aws_iam_policy_document.role_a_trust.json
}

resource "aws_iam_role_policy_attachment" "role_a_attach" {
  role       = aws_iam_role.roleA.name
  policy_arn = aws_iam_policy.role_a_policy.arn
}

# Role B - Can assume only roleC in Account B

data "aws_iam_policy_document" "role_b_trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.account_a_id}:root"]
    }
  }
}

resource "aws_iam_role" "roleB" {
  name               = "roleB"
  assume_role_policy = data.aws_iam_policy_document.role_b_trust.json
}

data "aws_iam_policy_document" "role_b_permissions" {
  statement {
    effect    = "Allow"
    actions   = ["sts:AssumeRole"]
    resources = ["arn:aws:iam::${var.account_b_id}:role/${var.role_c_name}"]
  }
}

resource "aws_iam_role_policy" "role_b_assume_role_c" {
  name   = "assume-roleC-only"
  role   = aws_iam_role.roleB.id
  policy = data.aws_iam_policy_document.role_b_permissions.json
}

output "role_b_arn" {
  value = aws_iam_role.roleB.arn
}
