output "ses_domain_identity_arn" {
  value       = "_amazonses.${aws_ses_domain_identity.ses.arn}"
  description = "The ARN of the SES domain identity"
}

output "ses_verification_record_name" {
  value       = "_amazonses.${aws_ses_domain_identity.ses.id}"
  description = "A name of record which when added to the domain as TXT will signal to SES that the owner of the domain has authorised SES to act on their behalf."
}

output "ses_verification_record_value" {
  value       = "${aws_ses_domain_identity.ses.verification_token}"
    description = <<EOT
A code which when added to the domain as a TXT record will signal to SES that the owner of the domain has authorised SES to act on their behalf.
The domain identity will be in state 'verification pending' until this is done.
Find out more about verifying domains in Amazon SES in the [AWS SES docs](https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html).
EOT
}

output "dkim_record_name__1" {
  value       = "${element(aws_ses_domain_dkim.ses_dkim.dkim_tokens, 1)}._domainkey"
  description = "A first name of record which need added to the domain as CNAME allows for receivers to verify that emails were indeed authorized by the domain owner."
}

output "dkim_record_name__2" {
  value       = "${element(aws_ses_domain_dkim.ses_dkim.dkim_tokens, 2)}._domainkey"
  description = "A second name of record which need added to the domain as CNAME allows for receivers to verify that emails were indeed authorized by the domain owner."
}

output "dkim_record_name__3" {
  value       = "${element(aws_ses_domain_dkim.ses_dkim.dkim_tokens, 3)}._domainkey"
  description = "A third name of record which when added to the domain as CNAME allows for receivers to verify that emails were indeed authorized by the domain owner."
}

output "dkim_record_value__1" {
  value = ["${element(aws_ses_domain_dkim.ses_dkim.dkim_tokens, 1)}.dkim.amazonses.com"]
}

output "dkim_record_value__2" {
  value = ["${element(aws_ses_domain_dkim.ses_dkim.dkim_tokens, 2)}.dkim.amazonses.com"]
}

output "dkim_record_value__3" {
  value = ["${element(aws_ses_domain_dkim.ses_dkim.dkim_tokens, 3)}.dkim.amazonses.com"]
}

output "dkim_records_tokens" {
  value       = "${aws_ses_domain_dkim.ses_dkim.dkim_tokens}"
  description = "A list of records, *if you prefer list*, which when added to the domain as CNAMEs allows for receivers to verify that emails were indeed authorized by the domain owner."
}

output "smtp_username" {
  value       = aws_iam_access_key.smtp_user.id
  description = "The SMTP user"
}

output "smtp_password" {
  value       = aws_iam_access_key.smtp_user.ses_smtp_password_v4
  description = "The SMTP password. This will be written to the state file in plain text."
  sensitive = true
}
