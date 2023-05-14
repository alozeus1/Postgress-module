resource "aws_security_group" "postgresql_sg" {
  name_prefix = var.aws_security_group
  #  vpc_id = "aws_vpc.main.id"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "postgresql_subnet_group" {
  name        = "postgresql_subnet_group"
  subnet_ids  = [var.aws_db_subnet_group[0], var.aws_db_subnet_group[1]]
  description = "Subnet group for PostgreSQL instance"
}

resource "aws_db_instance" "postgresql_instance" {
  identifier                  = var.identifier
  allocated_storage           = var.instance_allocated_storage
  max_allocated_storage       = var.max_allocated_storage
  publicly_accessible         = var.publicly_accessible
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  name                        = var.name
  username                    = var.username
  password                    = var.password
  parameter_group_name        = var.parameter_group_name
  maintenance_window          = var.maintenance_window
  backup_retention_period     = var.backup_retention_period
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  storage_encrypted           = var.storage_encrypted
  multi_az                    = var.multi_az
  skip_final_snapshot         = var.skip_final_snapshot
  #final_snapshot_identifier = "example-final-snapshot"
  deletion_protection    = var.deletion_protection
  db_subnet_group_name   = aws_db_subnet_group.postgresql_subnet_group.name
  vpc_security_group_ids = [aws_security_group.postgresql_sg.id]
}

resource "aws_db_parameter_group" "example" {
  name   = var.aws_db_parameter_group[0]
  family = var.aws_db_parameter_group[1]
}

provider "aws" {
  region = var.aws_region
}

# terraform blocks

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
aws_region                  = "us-east-1"
vpc_cidr_block              = "10.0.0.0/16"
subnet_cidr_block           = "10.0.1.0/24"
identifier                  = "postgresql-instance"
instance_allocated_storage  = 20
max_allocated_storage       = 100
publicly_accessible         = "false"
instance_class              = "db.t3.small"
engine                      = "postgres"
engine_version              = "13.3"
name                        = "Artifactory"
username                    = "exampleuser"
password                    = "examplepassword"
maintenance_window          = "Mon:00:00-Mon:03:00"
backup_retention_period     = "7"
allow_major_version_upgrade = "false"
auto_minor_version_upgrade  = "false"
storage_encrypted           = "true"
multi_az                    = "false"
skip_final_snapshot         = "true"
deletion_protection         = "false"
aws_db_parameter_group      = ["postgresql-instance-param-group", "postgres13"]
aws_security_group          = "postgresql_sg"
aws_db_subnet_group         = ["subnet-002c2716a4beda68b", "subnet-033d7cf8f954575e9"]
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


