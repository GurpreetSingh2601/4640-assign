
output "server_ip" {
  value = digitalocean_droplet.web.*.ipv4_address
}

output "database_url" {
  value = digitalocean_database_cluster.mongodb-example.id
  description = "The database connection's full url"
  sensitive = true
}

output "bastion_ip" {
    value = digitalocean_droplet.bastion.ipv4_address
}

output "loadbalancer_ip"{
    value = digitalocean_loadbalancer.public.ip
}
