aws_region   = "us-east-1"
project_name = "jenkins-terraform-ec2"

instance_type = "t3.micro"

key_name = "jenkins-key"

allowed_ssh_cidr     = "108.12.217.232/32"
allowed_jenkins_cidr = "108.12.217.232/32"

bucket_name = "jenkins-terraform-ec2-artifacts-iamwillsoto"
