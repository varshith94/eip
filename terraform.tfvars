cidr_block               = "10.40.0.0/16"
vpc_name                 = "prod"
cidr_block_publicsubnet  = ["10.40.1.0/24", "10.40.2.0/24", "10.40.3.0/24"]
azs                      = ["us-east-1a", "us-east-1b", "us-east-1c"]
cidr_block_privatesubnet = ["10.40.4.0/24", "10.40.5.0/24", "10.40.6.0/24"]
 ami = "ami-0cd59ecaf368e5ccf"
#  private_ip = ["10.40.1.5","10.40.2.5"]
 key_name = "priya"
 iam_profile = "ec2-role"
 instance_type = "t2.micro"
#  private1_ip = ["10.40.4.5","10.40.5.6"]









  