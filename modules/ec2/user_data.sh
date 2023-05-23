#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
echo "hi himanshi" > /var/www/html/index.html
