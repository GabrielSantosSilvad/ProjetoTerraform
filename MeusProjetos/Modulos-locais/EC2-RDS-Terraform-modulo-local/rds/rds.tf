resource "aws_db_instance" "RDS_teste" {
  allocated_storage      = var.allocated_storage_rds
  db_name                = var.name_db
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = var.instance_class_db
  username               = "admin"
  password               = "admin123"
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = var.db_subnet_group
  vpc_security_group_ids = [var.vpc_security_group_ids]
  skip_final_snapshot    = true
}
