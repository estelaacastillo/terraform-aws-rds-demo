provider "aws" {
  region = var.aws_region

}

resource "aws_db_subnet_group" "default" {
  name       = "my-rds-subnet-group"
  subnet_ids = ["subnet-0b81b078351dc667a", "subnet-03b57312e9b648f24"]  # Replace with your subnet IDs in different AZs

  tags = {
    Name = "My RDS subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "esteladb"
  username             = "admin"
  password             = "Monterroso77777!"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.default.name

  tags = {
    Name = "PrimaryRDSInstance"
  }
}

output "aws_rds_endpoint" {
  value = aws_db_instance.default.endpoint
}

