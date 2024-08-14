# Django API Consumer with Circuit Breaker
## AWS Lambda code

For test the Django application and the circuit breaker code we'll create a basic AWS Lambda function. This function to a GET petition to a external API and return a simple JSON response with the GET data.

We'll use AWS API Gateway to create a basic REST API with this Lambda function.

### Setup our function

In our local machine we have to create a basic Requierements.txt file with the libraries will we use in the Lambda function.

1. **Download all requirements:**

    ```bash
    pip install -r requirements.txt -t .
    ```
2. **Create a ZIP file:**

You can uso PowerShell to create a ZIP file with the code and folder libraries.

    ```bash
    zip -r9 function.zip .
    ```
3. **Deploy the function code in AWS Lambda:**

Log in the AWS Console and create the Lambda function and integrate the API Gateway.