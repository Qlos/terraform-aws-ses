variable "domain_name" {
  description = "The domain to create the SES"
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags map for resources"
}
