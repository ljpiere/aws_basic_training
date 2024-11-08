import boto3
import time

# Create an EC2 client
ec2 = boto3.client('ec2', region_name='us-east-1')

# Make 100 API calls
for i in range(100):
    ec2.describe_instances()
    print(f"Call: ", {i})
    time.sleep(0.1)

print("Finished making 100 API calls to describe EC2 instances.")