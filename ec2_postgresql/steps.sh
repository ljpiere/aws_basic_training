# Conexión a EC2
ssh -i /path/to/your-key-file.pem ec2-user@your-instance-public-dns
ssh -i /path/to/your-key-file.pem ubuntu@your-instance-public-dns

# Instalar PostgreSQL
sudo yum update -y  # Para Amazon Linux
sudo apt update -y # O para Ubuntu
sudo apt upgrade -y # O para Ubuntu

sudo amazon-linux-extras install postgresql13 -y # Para Amazon Linux
sudo yum install postgresql-server postgresql-contrib -y # Para Amazon Linux
sudo apt install postgresql postgresql-contrib -y # O para Ubuntu

# Inicializar base de datos
sudo postgresql-setup initdb
sudo service postgresql start # O para Ubuntu

# Configurar acceso
sudo nano /var/lib/pgsql/data/pg_hba.conf  # Amazon Linux
sudo nano /etc/postgresql/12/main/pg_hba.conf # O para Ubuntu

    # Agregar esto al final del archivo
host    all             all             0.0.0.0/0               md5

# Configurar motor
sudo nano /var/lib/pgsql/data/postgresql.conf  # Amazon Linux
sudo nano /etc/postgresql/12/main/postgresql.conf # O para Ubuntu
    # Buscamos esta linea y modificamos
listen_addresses = '*'

    # Reiniciamos el motor
sudo systemctl restart postgresql  # Amazon Linux
sudo systemctl restart postgresql # O para Ubuntu


# Creamos usuario
sudo -i -u postgres
psql

CREATE USER myuser WITH PASSWORD 'mypassword';
CREATE DATABASE mydb;
GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;

    # salimos del editor
\q
exit

#------------------------------------------------------------------
# Configuremos conexión remota

# Editar el grupo de seguridad: Edit inbound rules  
Type: PostgreSQL
Protocol: TCP
Port Range: 5432
Source: Your IP (or 0.0.0.0/0 for any IP, aunque no es recomendable por razones de seguridad)

# Configuramos archivo del motor
sudo nano /var/lib/pgsql/data/pg_hba.conf  # Amazon Linux
sudo nano /etc/postgresql/12/main/pg_hba.conf # O para Ubuntu

#agregamos
host    all             all             0.0.0.0/0               md5

# ahora la conexión
sudo nano /var/lib/pgsql/data/postgresql.conf  # Amazon Linux
sudo nano /etc/postgresql/12/main/postgresql.conf # O para Ubuntu
# cambiamos la linea
listen_addresses = '*'

# reiniciamos
sudo systemctl restart postgresql  # Amazon Linux
sudo systemctl restart postgresql # O para Ubuntu



# Ahora en DBeaver
Host: La dirección pública de tu instancia EC2.
Port: 5432 (el puerto por defecto para PostgreSQL).
Database: mydb (o el nombre de tu base de datos).
Username: myuser (o el nombre de usuario que creaste).
Password: mypassword (la contraseña del usuario).


