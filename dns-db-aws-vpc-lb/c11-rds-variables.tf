# Variables for RDS DB

variable "rds_name"{
    description = "This is my RDS name"
    type = string
}

variable "rds_instance_identifier"{
    description = "This is my RDS instance identifier"
    type = string
}

variable "rds_db_username"{
    description = "This is my RDS Admin username"
    type = string
}

variable "rds_db_password"{
    description = "This is my RDS name"
    type = string
    sensitive = true
}
