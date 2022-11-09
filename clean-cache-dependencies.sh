#!/bin/bash
# It cleans the system's cache and dependencies

sudo yum clean all
sudo yum autoremove

echo "The system's cache and dependencies cleaned today, $(date)" >> /tmp/var.log