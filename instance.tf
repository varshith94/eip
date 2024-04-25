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
yum update -y
set -e
terraform "$@"
amazon-linux-extras install nginx1.12 -y
service nginx start
echo "<div><h1>PUBLIC-SERVER</h1></div>" >> /usr/share/nginx/html/index.html

EOF
tags = {
    Name = "${var.vpc_name}-publicserver"
}
}

resource "aws_instance" "privateserver" {
    count =1
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id = element(aws_subnet.privatesubnets[*].id,count.index)
    # private_ip = var.private1_ip
    iam_instance_profile = var.iam_profile
     user_data = <<-EOF
#!/bin/bash
yum update -y
set -e
terraform "$@"
amazon-linux-extras install nginx1.12 -y
service nginx start
echo "<div><h1>PRIVATE-SERVER</h1></div>" >> /usr/share/nginx/html/index.html
EOF
tags = {
    Name = "${var.vpc_name}-privateserver"
}
}