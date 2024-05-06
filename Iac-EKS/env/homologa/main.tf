module "homologa" {
   source = "../../infra"
   nome_repositorio = "homologacao"
   cargoIAM = "homologador"
   ambiente = "homologacao"
}

output "IP_alb_homo" {
 value =  module.prod.IP
}