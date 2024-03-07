locals {
  iam_policy_name  = "${var.domain_name}_ses_sender"
  iam_policy_desc  = "Allows sending of email form AWS SES via SMTP for ${var.domain_name} domain"
  iam_user_name    = "${var.domain_name}_SMTP_user"
}

resource "aws_ses_domain_identity" "ses" {
  domain = "${var.domain_name}"
}

resource "aws_ses_domain_dkim" "ses_dkim" {
  domain = aws_ses_domain_identity.ses.domain
}

resource "aws_iam_user" "smtp_user" {
  name = local.iam_user_name
}

resource "aws_iam_access_key" "smtp_user" {
  user = aws_iam_user.smtp_user.name
}

data "aws_iam_policy_document" "ses_sender" {
  statement {
    actions   = ["ses:SendEmail", "ses:SendRawEmail"]
    resources = [
      aws_ses_domain_identity.ses.arn
    ]
  }
}

resource "aws_iam_policy" "ses_sender" {
  name        = local.iam_policy_name
  description = local.iam_policy_desc
  policy      = data.aws_iam_policy_document.ses_sender.json
  tags        = var.tags
}

resource "aws_iam_user_policy_attachment" "test-attach" {
  user       = aws_iam_user.smtp_user.name
  policy_arn = aws_iam_policy.ses_sender.arn
}
