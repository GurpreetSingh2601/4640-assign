resource "digitalocean_vpc" "web_vpc" {
  name = "web"
  region = var.region
}
