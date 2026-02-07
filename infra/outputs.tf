output "jenkins_url" {
  description = "Jenkins web interface"
  value       = "http://${aws_instance.jenkins.public_ip}:${var.jenkins_port}"
}

output "jenkins_public_ip" {
  description = "Public IP of the Jenkins server"
  value       = aws_instance.jenkins.public_ip
}

output "artifacts_bucket" {
  description = "S3 bucket used by Jenkins"
  value       = aws_s3_bucket.artifacts.bucket
}

output "instance_role" {
  description = "IAM role attached to the Jenkins EC2 instance"
  value       = aws_iam_role.jenkins_role.name
}
