# Guía para Despliegue de Nginx en EC2

## 1. Utiliza una AMI de Ubuntu

Para este ejemplo, se recomienda usar una AMI de Ubuntu en AWS.

---

## 2. Verificar permisos de la clave

Antes de conectarte a la instancia, debes asegurarte de que tu clave `.pem` tenga los permisos correctos. Usa el siguiente comando para cambiar los permisos:

```bash
chmod 400 your-key.pem
```

Conéctate a la instancia EC2:

```bash
ssh -i "your-key.pem" ubuntu@your-public-dns
```

---

## 3. Iniciar sesión en la instancia EC2

Una vez conectado a la instancia, actualiza el sistema operativo:

```bash
sudo apt update
```

### a. Instalar y ejecutar Nginx

Instala Nginx, un servidor web popular, con el siguiente comando:

```bash
sudo apt install nginx -y
```

Inicia el servicio de Nginx y habilítalo para que se ejecute automáticamente en cada reinicio de la instancia:

```bash
sudo systemctl start nginx
sudo systemctl enable nginx
```

---

## 4. Envío del archivo `index.html` a la instancia EC2

Asegúrate de cambiar los detalles como el usuario ("ubuntu"), el nombre del DNS público de tu instancia y el nombre de la clave en el siguiente comando. Utiliza `scp` para enviar tu archivo `index.html` desde tu computadora local a la instancia EC2:

```bash
scp -i "20241505_llavesSSH.pem" index.html ubuntu@ec2-54-90-249-36.compute-1.amazonaws.com:/home/ubuntu/
```

---

## 5. Mover el archivo `index.html` a la carpeta de Nginx

Una vez que el archivo esté en tu instancia, debes moverlo al directorio adecuado de Nginx:

```bash
sudo mv /home/ubuntu/index.html /var/www/html/
```

A continuación, asegúrate de que el archivo tenga los permisos correctos:

```bash
sudo chown www-data:www-data /var/www/html/index.html
sudo chmod 644 /var/www/html/index.html
```

Ahora puedes acceder a tu archivo `index.html` ingresando el DNS público de tu instancia EC2 en el navegador.

---

## 6. Otra forma de hacerlo con Git

Si prefieres usar Git para descargar el archivo `index.html` desde un repositorio:

### a. Conéctate a la instancia

```bash
ssh -i "your-key.pem" ubuntu@your-public-dns
```

### b. Actualiza el sistema

```bash
sudo apt update
```

### c. Instala Git

```bash
sudo apt install git -y
git --version  # Verifica que Git se haya instalado correctamente
```

### d. Clona el repositorio

Clona el repositorio que contiene el archivo `index.html`:

```bash
git clone https://github.com/ljpiere/aws_basic_training.git
```

### e. Instala y configura Nginx

Instala Nginx, y repite los pasos para iniciarlo y habilitarlo:

```bash
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
```

Mueve el archivo `index.html` al directorio de Nginx:

```bash
sudo mv /home/ubuntu/aws_basic_training/ec2_webserver/index.html /var/www/html/
```

Asegúrate de establecer los permisos adecuados:

```bash
sudo chown www-data:www-data /var/www/html/index.html
sudo chmod 644 /var/www/html/index.html
```

Con esto, tu archivo `index.html` será accesible a través del DNS público de tu instancia.
