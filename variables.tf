variable "do_token" {}

#set the default region to sfo3

variable "region" {
  type    = string
  default = "sfo3"
}


#sets the number of droplets to create
variable "droplet_count" {
  type    = number
  default = 2
}
