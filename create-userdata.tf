resource "aws_instance" "web2" {
  ami = data.aws_ssm_parameter.instance_ami.value

  instance_type = var.instance_type

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd mysql
    amazon-linux-extras install -y php7.2
    systemctl start httpd
    systemctl enable httpd
    echo "Hello World from $(hostname -f)" > /var/www/html/index.html
    echo "Healthy" > /var/www/html/health.html
    yum install -y mysql
    mysql -h ${aws_db_instance.default.address} -P 3306 -u ${var.db_username} -p${var.db_password} -e "SHOW DATABASES;"
  EOF

  tags = {
    Name = "WebServer"
  }
}



