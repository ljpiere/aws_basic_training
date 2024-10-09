# Guía Básica de Despliegue en EC2

## 1. Conexión a la instancia

Para conectarte a tu instancia EC2, utiliza el siguiente comando, asegurándote de proporcionar la ruta a tu clave privada (`.pem`) y el DNS público de tu instancia EC2.

```bash
ssh -i /ruta/a/tu-clave.pem ec2-user@tu-dns-publico-ec2
```

## 2. Instalación de paquetes necesarios

### a. Actualiza el sistema y los paquetes

Es importante tener el sistema actualizado para evitar problemas de seguridad o compatibilidad. Usa los siguientes comandos:

```bash
sudo apt update && sudo apt upgrade -y  # para AMI de Ubuntu
```

### b. Instala Python y pip

Instalaremos `python3-pip`, que nos permitirá gestionar paquetes de Python.

```bash
sudo apt install python3-pip -y  # Para Ubuntu
```

### c. Instala Flask

Flask es un microframework para Python que usaremos para crear una API simple.

```bash
sudo apt install python3-flask -y  # Instalación de Flask
```

## 3. Cargar el código Python en la instancia

Sube tu código Python a la instancia utilizando `scp`:

```bash
scp -i "key.pem" api_python_code.py ubuntu@tu-dns-publico-ec2:/home/ubuntu/
```

Este comando copia el archivo `api_python_code.py` desde tu máquina local a la instancia EC2.

## 4. Ejecutar el código Python

Ejecuta el archivo de tu aplicación API de Flask:

```bash
python3 api_python_code.py
```

## 5. Verificación de seguridad en el grupo de seguridad

Asegúrate de que tu grupo de seguridad permite conexiones HTTP en el puerto 5000 (TCP personalizado), de lo contrario, no podrás acceder a la API desde el navegador.

---

## Opción Alternativa con Git

Si deseas clonar un repositorio desde GitHub y ejecutar el código directamente:

### a. Conexión a la instancia

Conéctate a tu instancia:

```bash
ssh -i /ruta/a/tu-clave.pem ec2-user@tu-dns-publico-ec2
```

### b. Instalar los paquetes necesarios

Repite los pasos de instalación:

```bash
sudo apt update && sudo apt upgrade -y  # Actualiza los paquetes
sudo apt install python3-pip -y  # Instala pip
sudo apt install python3-flask -y  # Instala Flask
```

### c. Instalar Git

```bash
sudo apt install git -y
git --version  # Verifica la instalación de Git
```

### d. Clonar el repositorio

Clona el repositorio con el código:

```bash
git clone https://github.com/ljpiere/aws_basic_training.git
cd aws_basic_training/ec2_api_python
python3 api_python_code.py
```

### e. Probar la API

Para probar tu API puedes usar `curl` o el navegador:

```bash
curl http://tu-dns-publico-ec2:5000/
```

---

## 6. Despliegue en Producción

Para un entorno de producción, es recomendable usar un servidor como **Gunicorn** y un servidor proxy inverso como **Nginx**.

### a. Instalar y ejecutar Gunicorn

Gunicorn es un servidor WSGI para aplicaciones Python.

```bash
sudo pip3 install gunicorn
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

### b. Instalar Nginx

Instala Nginx para manejar las peticiones de manera eficiente:

```bash
sudo apt install nginx -y  # Para Ubuntu
```

### c. Configurar Nginx

Inicia y habilita Nginx para que se ejecute en cada reinicio:

```bash
sudo systemctl start nginx
sudo systemctl enable nginx
```

Edita el archivo de configuración de Nginx para configurar el proxy inverso:

```bash
sudo nano /etc/nginx/nginx.conf  # o /etc/nginx/sites-available/default para Ubuntu
```

Finalmente, reinicia Nginx para aplicar los cambios:

```bash
sudo systemctl restart nginx
```

¡Y con esto tu aplicación estará lista para producción!
