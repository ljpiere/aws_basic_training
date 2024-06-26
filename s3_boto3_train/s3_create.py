import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError

# Nombre del bucket
bucket_name = "20240626pytljpcastro"

# Crear cliente S3
s3_client = boto3.client('s3')

try:
    # Crear el bucket
    response = s3_client.create_bucket(
        Bucket=bucket_name,
        CreateBucketConfiguration={
            'LocationConstraint': boto3.session.Session().region_name
        }
    )
    print(f'Bucket {bucket_name} creado con éxito.')
except s3_client.exceptions.BucketAlreadyExists as e:
    print(f'Error: El bucket {bucket_name} ya existe.')
except s3_client.exceptions.BucketAlreadyOwnedByYou as e:
    print(f'Error: El bucket {bucket_name} ya está en su cuenta.')
except NoCredentialsError:
    print("Error: No se encontraron las credenciales de AWS.")
except PartialCredentialsError:
    print("Error: Credenciales de AWS incompletas.")
except Exception as e:
    print(f'Ocurrió un error: {e}')
