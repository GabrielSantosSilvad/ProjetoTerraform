module "prod" {
   source = "../../infra"
   nome_repositorio = "producao"
   cargoIAM = "produtor"
   ambiente = "producao"
}

output "IP_alb" {
 value =  module.prod.IP
}