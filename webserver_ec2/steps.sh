#-----------------------------------------------------
# For this example please use Ubuntu as AMI
#-----------------------------------------------------

# Check key permissions
chmod 400 your-key.pem
ssh -i "your-key.pem" ubuntu@your-public-dns

#-----------------------------------------------------
# Log in into EC2 Instance
#-----------------------------------------------------
# Update system
sudo apt update
# Install and run nginx
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

#-----------------------------------------------------
# NOTE! Change your user "Ubuntu", the instance DNS name and the key name
# We'll use scp to send the index.html file into our EC2 instance using the windows terminal
scp -i "20241505_llavesSSH.pem" index.html ubuntu@ec2-54-90-249-36.compute-1.amazonaws.com:/home/ubuntu/

# move the index.html into the nginx folder
sudo mv /home/ubuntu/index.html /var/www/html/

# Check permissions
sudo chown www-data:www-data /var/www/html/index.html
sudo chmod 644 /var/www/html/index.html

# Locate your public instance DNS into the EC2 menu
