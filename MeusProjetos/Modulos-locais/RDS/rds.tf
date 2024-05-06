resource "aws_db_instance" "RDS_teste" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "admin123"
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = data.terraform_remote_state.vpc.outputs.subnet_DB_nameGrupo
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.security_id_DB]
  skip_final_snapshot    = true
}
