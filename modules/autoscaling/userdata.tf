 variable "user_data_template" {
  description = "User data for launch template"
  default = <<-EOT
    #!/bin/bash
    sudo apt update
    sudo apt install apache2 -y
    sudo systemctl enable apache2
    sudo systemctl start apache2
    sudo echo "<h1> This is Maria's Terraform final project. Hello from $HOSTNAME! </h1>" > /var/www/html/index.html
  EOT
}