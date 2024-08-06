## Creación de Tablas

```sql
CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    departamento_id INT
);

CREATE TABLE departamentos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100)
);

```

## Inserción de Datos

```sql
INSERT INTO empleados (nombre, departamento_id) VALUES ('Juan Pérez', 1);
INSERT INTO empleados (nombre, departamento_id) VALUES ('Ana Gómez', 2);
INSERT INTO empleados (nombre, departamento_id) VALUES ('Luis Martínez', 1);

INSERT INTO departamentos (nombre) VALUES ('Recursos Humanos');
INSERT INTO departamentos (nombre) VALUES ('Finanzas');

```

## Ejemplo de Sentencias JOIN

```sql
SELECT empleados.nombre, departamentos.nombre AS departamento
FROM empleados
JOIN departamentos ON empleados.departamento_id = departamentos.id;

```

## Sentencias Básicas en SQL

- **Selección de datos**

```sql
SELECT * FROM empleados;
SELECT nombre FROM departamentos;

```

- **Filtrado de datos**

```sql
SELECT * FROM empleados WHERE departamento_id = 1;
SELECT nombre FROM empleados WHERE nombre LIKE 'A%';

```

- **Ordenación de resultados**

```sql
SELECT * FROM empleados ORDER BY nombre ASC;
SELECT * FROM departamentos ORDER BY nombre DESC;

```

- **Actualización de datos**

```sql
UPDATE empleados SET nombre = 'Carlos Sánchez' WHERE id = 1;
UPDATE departamentos SET nombre = 'Marketing' WHERE id = 2;

```

- **Eliminación de datos**

```sql
DELETE FROM empleados WHERE id = 3;
DELETE FROM departamentos WHERE id = 1;

```

## Sentencias Avanzadas en SQL

- **Uso de funciones agregadas**

```sql
SELECT COUNT(*) FROM empleados;
SELECT AVG(salario) FROM empleados WHERE departamento_id = 2;

```

- **Subconsultas**

```sql
SELECT nombre FROM empleados WHERE departamento_id = (SELECT id FROM departamentos WHERE nombre = 'Finanzas');

```

- **Uniones (UNION)**

```sql
SELECT nombre FROM empleados WHERE departamento_id = 1
UNION
SELECT nombre FROM empleados WHERE departamento_id = 2;

```

- **Agrupación de datos (GROUP BY)**

```sql
SELECT departamento_id, COUNT(*) AS num_empleados
FROM empleados
GROUP BY departamento_id;

```

- **Tener cláusula (HAVING)**

```sql
SELECT departamento_id, COUNT(*) AS num_empleados
FROM empleados
GROUP BY departamento_id
HAVING COUNT(*) > 1;

```