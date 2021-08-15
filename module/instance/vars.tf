variable "subnet_id" {

  default     = ""
  description = "description"
}

variable "ami" {
  type        = string
  # default     = "ami-0c2b8ca1dad447f8a"
  default     = "ami-0747bdcabd34c712a"
  description = "description"
}


variable "instance_type" {
  type        = string
  default     = "t2.medium"
  description = "description"
}


variable "security_group" {
  default     = []
  description = "description"
}

variable "key" {
  type        = string
  default     = ""
  description = "description"
}

variable "environment" {
  type        = string
  default     = ""
  description = "description"
}

