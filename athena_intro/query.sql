-- Creamos nuestra base de datos
CREATE DATABASE mi_base_datos;

-- Tabla autor (validar nombre)
CREATE EXTERNAL TABLE IF NOT EXISTS mi_base_datos.tblAuthor (
    AuthorId STRING,
    AuthorName STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
    'serialization.format' = ',',
    'field.delim' = ','
)
LOCATION 's3://20240702pruebatahenaleyton/'
TBLPROPERTIES ('has_encrypted_data'='false',
    'skip.header.line.count'='1');

-- Tabla compañia (validar nombre)
CREATE EXTERNAL TABLE IF NOT EXISTS mi_base_datos.tblCompanion (
    CompanionId STRING,
    CompanionName STRING,
    WhoPlayed STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
    'serialization.format' = ',',
    'field.delim' = ','
)
LOCATION 's3://20240702pruebatahenaleyton/'
TBLPROPERTIES ('has_encrypted_data'='false',
    'skip.header.line.count'='1');

-- Tabla doctor (validar nombre)
CREATE EXTERNAL TABLE IF NOT EXISTS mi_base_datos.tblDoctor (
    DoctorId STRING,
    DoctorNumber STRING,
    DoctorName STRING,
    BirthDate  STRING,
    FirstEpisodeDate  STRING,
    LastEpisodeDate  STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
    'serialization.format' = ',',
    'field.delim' = ','
)
LOCATION 's3://20240702pruebatahenaleyton/'
TBLPROPERTIES ('has_encrypted_data'='false',
    'skip.header.line.count'='1');

-- Tabla Episodio (validar nombre)
CREATE EXTERNAL TABLE IF NOT EXISTS mi_base_datos.tblEpisode (
    DoctorId STRING,
    DoctorNumber STRING,
    DoctorName STRING,
    BirthDate STRING, 
    FirstEpisodeDate STRING,
    LastEpisodeDate STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
    'serialization.format' = ',',
    'field.delim' = ','
)
LOCATION 's3://20240702pruebatahenaleyton/'
TBLPROPERTIES ('has_encrypted_data'='false', 'skip.header.line.count'='1');


-- Probamos!
SELECT * FROM mi_base_datos.tblEpisode;
