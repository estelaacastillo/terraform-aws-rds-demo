variable "aws_region" {
  type = string
  description = "Default aws region to deploy into"
  default = "us-east-1"
  }

variable "db_name" {
  type = string
  description = "Default db name to deploy into"
  }

variable "password" {
  type = string
  description = "Default to deploy into"
  }

