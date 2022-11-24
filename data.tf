data "digitalocean_ssh_key" "ubuntu_ssh" {
  name = "ubuntu_ssh"
}

data "digitalocean_project" "lab_project" {
  name = "first-project"
}
