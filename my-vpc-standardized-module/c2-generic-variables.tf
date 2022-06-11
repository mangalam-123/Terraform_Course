variable "aws_region" {
    description = "This is the region in which we will create our resources"
    type = string
    default = "ap-sout-1"
}

variable "environment" {
    description = "This is the Environment name we are currently working on"
    type = string
    default = "DEV"
}

variable "business_division" {
    description = "This is the Businness Division we are currently working on"
    type = string
    default = "SAP"
}


