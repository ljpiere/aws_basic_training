# Tutorial: Configurar un Balanceador de Carga y Grupo de Autoescalado en AWS (Capa Gratuita)

Este tutorial muestra cómo configurar un **Balanceador de Carga** y un **Grupo de Autoescalado** en AWS usando la capa gratuita.

## Pasos

### 1. Crear una Plantilla de Lanzamiento (Launch Template)

1. Ve a la consola de **EC2** en AWS.
2. En el menú de la izquierda, selecciona **Launch Templates** y haz clic en **Create launch template**.
3. Configura los siguientes parámetros:
   - **Template Name:** `my-launch-template`
   - **AMI:** Amazon Linux 2 o Ubuntu 22.04 LTS.
   - **Instance Type:** `t2.micro` (capa gratuita).
   - **Key Pair:** Selecciona un par de claves para SSH.
   - **Security Group:** Permitir tráfico HTTP (puerto 80) y SSH (puerto 22).
   - **User Data:** Añade este script para que cada instancia tenga un servidor web simple:
     ```bash
     #!/bin/bash
     sudo yum update -y
     sudo yum install -y httpd
     sudo systemctl start httpd
     sudo systemctl enable httpd
     echo "<h1>Hello from $(hostname)</h1>" > /var/www/html/index.html
     ```
4. Haz clic en **Create launch template**.

### 2. Crear un Grupo de Autoescalado

1. Ve a **Auto Scaling Groups** y selecciona **Create Auto Scaling group**.
2. Asigna un nombre: `my-auto-scaling-group`.
3. Selecciona la plantilla de lanzamiento creada anteriormente (`my-launch-template`).
4. Selecciona una **VPC** y al menos dos subnets en diferentes zonas de disponibilidad.
5. En **Load Balancing**, selecciona **Attach to a new load balancer**:
   - **Type:** Application Load Balancer (ALB)
   - **Name:** `my-load-balancer`
   - **Listeners:** Puerto 80 (HTTP)
   - **Availability Zones:** Selecciona las mismas subnets.
6. Configura la **Capacidad**:
   - **Desired capacity:** 2 (número inicial de instancias).
   - **Minimum capacity:** 1.
   - **Maximum capacity:** 3.

### 3. Configurar el Escalado Automático

1. En el mismo paso de creación del grupo de escalado, selecciona **Scaling policies**.
2. Elige **Target tracking scaling policy**.
3. Configura una política para mantener el uso de la **CPU al 40%**.

### 4. Verificar el Balanceador de Carga

1. Ve a **Load Balancers** en la consola de EC2.
2. Copia el **DNS Name** del balanceador de carga.
3. En tu navegador, visita la URL con el DNS. Deberías ver algo como `Hello from <nombre de instancia>`.
4. Recarga la página para ver cómo cambia el nombre de la instancia, indicando que el balanceador está funcionando.

### 5. Escalar Manualmente o Probar el Autoescalado

- Puedes modificar manualmente la capacidad deseada en **Auto Scaling Groups**.
- O bien, genera carga en las instancias para probar el escalado automático (por ejemplo, ejecutando un proceso que consuma CPU).

### 6. Monitoreo y Terminación

- Monitorea las métricas de CPU y estado de las instancias en **CloudWatch**.
- Detén o termina las instancias EC2 y el grupo de autoescalado al finalizar para evitar cargos.

