<!-- BEGIN_TF_DOCS -->
## Documentation


### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.smtp_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.ses_sender](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.smtp_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.test-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_ses_domain_dkim.ses_dkim](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_dkim) | resource |
| [aws_ses_domain_identity.ses](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_iam_policy_document.ses_sender](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain to create the SES | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags map for resources | `map(string)` | `{}` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_dkim_record_name__1"></a> [dkim\_record\_name\_\_1](#output\_dkim\_record\_name\_\_1) | A first name of record which need added to the domain as CNAME allows for receivers to verify that emails were indeed authorized by the domain owner. |
| <a name="output_dkim_record_name__2"></a> [dkim\_record\_name\_\_2](#output\_dkim\_record\_name\_\_2) | A second name of record which need added to the domain as CNAME allows for receivers to verify that emails were indeed authorized by the domain owner. |
| <a name="output_dkim_record_name__3"></a> [dkim\_record\_name\_\_3](#output\_dkim\_record\_name\_\_3) | A third name of record which when added to the domain as CNAME allows for receivers to verify that emails were indeed authorized by the domain owner. |
| <a name="output_dkim_record_value__1"></a> [dkim\_record\_value\_\_1](#output\_dkim\_record\_value\_\_1) | n/a |
| <a name="output_dkim_record_value__2"></a> [dkim\_record\_value\_\_2](#output\_dkim\_record\_value\_\_2) | n/a |
| <a name="output_dkim_record_value__3"></a> [dkim\_record\_value\_\_3](#output\_dkim\_record\_value\_\_3) | n/a |
| <a name="output_dkim_records_tokens"></a> [dkim\_records\_tokens](#output\_dkim\_records\_tokens) | A list of records, *if you prefer list*, which when added to the domain as CNAMEs allows for receivers to verify that emails were indeed authorized by the domain owner. |
| <a name="output_ses_domain_identity_arn"></a> [ses\_domain\_identity\_arn](#output\_ses\_domain\_identity\_arn) | The ARN of the SES domain identity |
| <a name="output_ses_verification_record_name"></a> [ses\_verification\_record\_name](#output\_ses\_verification\_record\_name) | A name of record which when added to the domain as TXT will signal to SES that the owner of the domain has authorised SES to act on their behalf. |
| <a name="output_ses_verification_record_value"></a> [ses\_verification\_record\_value](#output\_ses\_verification\_record\_value) | A code which when added to the domain as a TXT record will signal to SES that the owner of the domain has authorised SES to act on their behalf.<br>The domain identity will be in state 'verification pending' until this is done.<br>Find out more about verifying domains in Amazon SES in the [AWS SES docs](https://docs.aws.amazon.com/ses/latest/dg/creating-identities.html). |
| <a name="output_smtp_password"></a> [smtp\_password](#output\_smtp\_password) | The SMTP password. This will be written to the state file in plain text. |
| <a name="output_smtp_username"></a> [smtp\_username](#output\_smtp\_username) | The SMTP user |

<!-- END_TF_DOCS -->