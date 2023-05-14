variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_security_group" {
  type    = string
  default = "postgresql_sg"
}

variable "aws_db_subnet_group" {
  type = list(any)
  default = [
    "subnet-002c2716a4beda68b",
    "subnet-033d7cf8f954575e9",
  ]
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block of the subnet where the PostgreSQL instance will be launched."
}

variable "identifier" {
  type    = string
  default = "postgresql-instance"
}

variable "instance_allocated_storage" {
  type    = string
  default = "20"
}

variable "max_allocated_storage" {
  type    = string
  default = "100"
}

variable "publicly_accessible" {
  type    = string
  default = "false"
}

variable "engine" {
  type    = string
  default = "postgres"
}

variable "engine_version" {
  type    = string
  default = "13.3"
}

variable "instance_class" {
  type    = string
  default = "db.t3.small"
}

variable "name" {
  type    = string
  default = "Artifactory"
}

variable "username" {
  type    = string
  default = "exampleuser"
}

variable "password" {
  type    = string
  default = "examplepassword"
}

variable "parameter_group_name" {
  type    = string
  default = "postgresql-instance-param-group"
}

variable "maintenance_window" {
  type    = string
  default = "Mon:00:00-Mon:03:00"
}

variable "backup_retention_period" {
  type    = string
  default = "7"
}

variable "allow_major_version_upgrade" {
  type    = string
  default = "false"
}

variable "auto_minor_version_upgrade" {
  type    = string
  default = "false"
}

variable "storage_encrypted" {
  type    = string
  default = "true"
}

variable "multi_az" {
  type    = string
  default = "false"
}

variable "skip_final_snapshot" {
  type    = string
  default = "true"
}

variable "deletion_protection" {
  type    = string
  default = "false"
}

variable "aws_db_parameter_group" {
  type = list(any)
  default = [
    "postgresql-instance-param-group",
    "postgres13",
  ]
}


