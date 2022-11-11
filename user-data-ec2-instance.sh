#! /bin/bash
# Add this script to your User Data before creating an instance

# Install Apache Web Server
yum install httpd -y

# Turn on web server
systemctl enable httpd.service
systemctl start  httpd.service

# Setup Web Server
chmod 755 /var/www/html
echo "<html><body> Hello World!!! I am $HOSTNAME </body></html>" > /var/www/html/index.html