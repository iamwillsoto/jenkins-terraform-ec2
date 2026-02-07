variable "aws_region" {
  description = "AWS region where the system is deployed"
  type        = string
}

variable "project_name" {
  description = "System name used as a naming prefix across all resources"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for the Jenkins server"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair name for SSH access and system validation"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the Jenkins instance"
  type        = string
}

variable "allowed_jenkins_cidr" {
  description = "CIDR block allowed to access the Jenkins UI"
  type        = string
}

variable "jenkins_port" {
  description = "Port used by the Jenkins web interface"
  type        = number
  default     = 8080
}

variable "bucket_name" {
  description = "Globally unique S3 bucket used for Jenkins artifacts"
  type        = string
}
