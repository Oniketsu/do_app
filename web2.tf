# Create a new Web Droplet in the nyc1 region
resource "digitalocean_droplet" "web2" {
  image  = "docker-20-04"
  name   = "web2"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
  private_networking = true
  user_data = file("config/webuserdata.sh")
  ssh_keys = [var.ssh_fingerprint]
  connection{
      user = "root"
      type = "ssh"
      private_key = file(var.pvt_key)
      timeout = "2m"
      host = digitalocean_droplet.web2.ipv4_address
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo docker pull oniketsu/flaskapp:latest",
      "sudo docker run -dit --name web-site -p 80:5000 --restart always oniketsu/flaskapp:latest"
    ]
  }
}