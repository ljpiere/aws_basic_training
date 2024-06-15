# Executing a Docker image on a EC2

In this tutorial we weill create a EC2 instance executing a Docker image for a basic web site.

## Step 1: Log in into AWS console

Go to: https://aws.amazon.com/console/

## Step 2: Launch a EC2 Instance
Go to the EC2 dashboard and click on "Launch Instance" button. We can use these configurations for our instance:
1. AMI: Amazon Linux
2. Instance type: t3.micro
3. Storage: 6GB SSD Volume type

### Special configuración for firewall
We have to set up the security group for our instance:
1. SSH: Set up Port 22 for your IP address or anywhere (0.0.0.0/0) (WARNING!)
2. HTTP: Port 80 anywhere (0.0.0.0/0)
3. HTTPS: Port 443 anuwhere 0.0.0.0/0

Now we can launch the instance.
