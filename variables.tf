variable "do_token" {
    description = "Your Digital Ocean API Token"
    default = "$do_token"
  
}

variable "ssh_fingerprint" {
  description = "Your SSH key fingerprint"
  default     = "$ssh_fingerprint"
}

variable "pub_key" {
  type        = string
  description = "The path to your public SSH key"
  default     = "keys/digitalocean.pub"
}

variable "pvt_key" {
  type        = string
  description = "The path to your private SSH key"
  default     = "keys/digitalocean"
}