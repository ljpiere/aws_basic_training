#------------------------------------------------------------------------------------------
#  Basic deploy
#------------------------------------------------------------------------------------------
# Connecto the instance
ssh -i /path/to/your-key.pem ec2-user@your-ec2-public-dns

# Install requiere package
sudo yum update -y  # for amazon linus AMI
sudo apt update && sudo apt upgrade -y  # for Ubuntu AMI

sudo yum install python3 -y  # Para Amazon Linux
sudo apt install python3-pip -y  # Para Ubuntu

sudo pip3 install flask # we'll use flask to create the api

# load the python code into the instance
scp -i /path/to/your-key.pem app.py ec2-user@your-ec2-public-dns:/home/ec2-user/

# run the python code
python3 app.py

# check the security grpu for HTTP connection in port 5000

#------------------------------------
# Test
curl http://your-ec2-public-dns:5000/

#or, using a web browser: curl http://your-ec2-public-dns:5000/

#------------------------------------------------------------------------------------------
# For real PROD deploy
# Para un entorno de producción,
# considera usar un servidor como Gunicorn y un servidor proxy inverso como Nginx.

sudo pip3 install gunicorn
gunicorn -w 4 -b 0.0.0.0:5000 app:app

sudo yum install nginx -y  # Amazon Linux
sudo apt install nginx -y  # Ubuntu

sudo systemctl start nginx
sudo systemctl enable nginx

sudo nano /etc/nginx/nginx.conf  # o /etc/nginx/sites-available/default for Ubuntu

sudo systemctl restart nginx
