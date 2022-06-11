
# Region for provisioning the resources
variable "aws_region" {
    description = "This is the reqion of provisoning the resources"
    type = string
    default = "ap-south-1"
}

# Environment Name 
variable "Environment" {
    description = "The name of the Environment"
    type = string
    default = "Dev"
}

#Business_Unite name

variable "Business_unit" {
  description = "The business unit name of the account"
  type = string
  default = "SAP"

}
