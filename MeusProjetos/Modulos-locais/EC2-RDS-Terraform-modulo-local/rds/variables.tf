variable "allocated_storage_rds" {
  description = "Quando de Storage"
  type        = number
}

variable "name_db" {
  description = "Nome do banco"
  type        = string

}

variable "instance_class_db" {
  description = "Tipo da instancia"
  type        = string
}

variable "db_subnet_group" {
  description = "Grupo de Subnet para Db"
  type        = string

}

variable "vpc_security_group_ids" {
  description = "Security do DB"
  type        = string
}

variable "Skip_snapshot_final" {
  description = "Não colocar snapshot final"
  type        = bool

}
