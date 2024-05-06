variable "ports" {
  description = "Portas que serão abertas no security "
  type = map(object({
    description = string
    cidr_blocks = list(string)
  }))
  default = {
    22 = {
      description = "Porta 22 para VPN"
      cidr_blocks = ["0.0.0.0/0"]

    }
    80 = {
      description = "porta 80 para Internet"
      cidr_blocks = ["0.0.0.0/0"]

    }
    443 = {
      description = "Porta 443 para internet"
      cidr_blocks = ["0.0.0.0/0"]


    }
  }
}