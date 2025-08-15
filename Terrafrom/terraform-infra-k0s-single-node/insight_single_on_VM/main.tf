terraform {
  required_version = ">= 1.0"
}

module "nginx" {
  source = "./modules/nginx"
}

module "percona" {
  source = "./modules/percona"
}

module "k0s" {
  source = "./modules/k0s"
}
