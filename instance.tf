resource "aws_instance" "publicserver" {
    count =1
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id = element(aws_subnet.publicsubnets[*].id,count.index)
    # private_ip = var.private_ip
    iam_instance_profile = var.iam_profile
     
  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install openjdk-11-jre-headless -y
  curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update -y
  sudo apt-get install jenkins -y
  
  EOF
tags = {
    Name = "${var.vpc_name}-jenkinsserver"
}
}

# resource "aws_instance" "privateserver" {
#     count =2
#     ami = var.ami
#     instance_type = var.instance_type
#     key_name = var.key_name
#     vpc_security_group_ids = [aws_security_group.sg.id]
#     subnet_id = element(aws_subnet.privatesubnets[*].id,count.index)
#     # private_ip = var.private1_ip
#     iam_instance_profile = var.iam_profile
     
#   user_data = <<-EOF
#   #!/bin/bash
#   sudo apt update -y
#   sudo apt install openjdk-11-jre-headless -y
#   curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
#   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
#   echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
#   https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
#   /etc/apt/sources.list.d/jenkins.list > /dev/null
#   sudo apt-get update -y
#   sudo apt-get install jenkins -y
  
#   EOF
# tags = {
#     Name = "${var.vpc_name}-jenkinsserver"
# }
# }