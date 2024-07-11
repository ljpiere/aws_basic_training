# Create AWS service using code

## For S3

Remember that the bucket name has to be unique.

## For EC2

We need to check the AMI for Ubuntu (or you favorite AMI). For Ubuntu we could use this command into Amazon CLI:

```
aws ec2 describe-images --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*" --query "Images[*].[ImageId,Name]" --output text
```

