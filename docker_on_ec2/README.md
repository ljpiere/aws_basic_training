# Executing a Docker image on a EC2

In this tutorial we weill create a EC2 instance executing a Docker image for a basic web site.

## Step 1: Log in into AWS console

Go to: https://aws.amazon.com/console/

## Step 2: Launch a EC2 Instance
Go to the EC2 dashboard and click on "Launch Instance" button. We can use these configurations for our instance:
**1. AMI:** Amazon Linux
**2. Instance type:** t3.micro
**3. Storage:** 6GB SSD Volume type

### Special configuración for firewall
We have to set up the security group for our instance:
**1. SSH**: Set up Port 22 for your IP address or anywhere (0.0.0.0/0) (**WARNING!** This is a dangeorus configuration)
**2. HTTP:** Port 80 anywhere (0.0.0.0/0)
**3. HTTPS:** Port 443 anuwhere 0.0.0.0/0
**4. Keys:** Select a key or generate a one new one.

Now we can launch the instance.

## Step 3: Connect to EC2 Instance
Open a terminal and connect to your instance using SSH. You can use the command: `ssh -`. Example:
```sh
ssh -i "your-key-file.pem" ec2-user@your-ec2-public-dns
```
Maybe you have to change the .pem file permissions:
```
chmod 400 your-key-file.pem
```

## Step 4: Install Docker
In the EC2 terminal we have to install docker.
**1. Update the pacakge:** We have to update the `yum` files on our system:
```
sudo yum update -y
```

**2. Install Docker package:** 
```
sudo amazon-linux-extras install docker -y
```

**3. Start the Docker service in our system:**
```
sudo usermod -a -G docker ec2-user
```
Notice that `ec2-user` is the user that we use to log in into the instance.

**4. Restart the SSH connection:** Exit and log in into the instance again.

```
exit
ssh -i "your-key-file.pem" ec2-user@your-ec2-public-dns
```