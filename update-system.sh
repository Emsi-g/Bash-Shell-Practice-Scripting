#!/bin/bash
# System update and security
# You must be root or sudo

sudo yum update --security -y
sudo yum update -y

echo "The system checked the update today, $(date)" >> /tmp/var.log