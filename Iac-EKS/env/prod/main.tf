module "prod" {
   source = "../../infra"
   nome_repositorio = "producao"
   ambiente = "producao"
   cluster_name = "producao"
}


output "endereco" {
  value = module.prod.URL
}