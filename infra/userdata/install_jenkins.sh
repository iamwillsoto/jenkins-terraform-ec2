#!/bin/bash
set -euxo pipefail

dnf update -y
dnf install -y java-17-amazon-corretto wget git

wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

dnf install -y jenkins
systemctl enable jenkins
systemctl start jenkins
