variable "environment" {
    description = "Enviornment of the AWS Account"
    type        = string
}

variable "resource_type" {
  description = "The type of resource. eg. resource_group"
  type        = string
  default     = null
}

variable "name" {
  description = "The user-defined part of the name which makes the resource name unique among all other resources"
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "For AZ specific resources, this is the availability zone to use in the resource name. eg. a, b, c"
  type        = string
  default     = null
}