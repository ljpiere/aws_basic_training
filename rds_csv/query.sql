-- Creamos nuestra base de datos
CREATE DATABASE mi_base_datos;

-- Cambia a la base de datos creada
\c mi_base_datos;

-- Tabla autor (validar nombre)
CREATE TABLE tblAuthor (
    AuthorId VARCHAR(100),
    AuthorName VARCHAR(100)
);

-- Tabla compañia (validar nombre)
CREATE TABLE tblCompanion (
    CompanionId VARCHAR(100),
    CompanionName VARCHAR(100),
    WhoPlayed VARCHAR(100)
);

-- Tabla doctor (validar nombre)
CREATE TABLE tblDoctor (
    DoctorId VARCHAR(100),
    DoctorNumber VARCHAR(100),
    DoctorName VARCHAR(100),
    BirthDate  VARCHAR(100),
    FirstEpisodeDate  VARCHAR(100),
    LastEpisodeDate  VARCHAR(100)
);

-- Tabla Episodio (validar nombre)
CREATE TABLE tblEpisode (
    DoctorId VARCHAR(100),
    DoctorNumber VARCHAR(100),
    DoctorName VARCHAR(100),
    BirthDate VARCHAR(100),
    FirstEpisodeDate VARCHAR(100),
    LastEpisodeDate VARCHAR(100)
);

psql -h <hostname> -U <username> -d mi_base_datos -c "\COPY tblAuthor FROM '/ruta/local/tblAuthor.csv' DELIMITER ',' CSV HEADER;"
psql -h <hostname> -U <username> -d mi_base_datos -c "\COPY tblCompanion FROM '/ruta/local/tblCompanion.csv' DELIMITER ',' CSV HEADER;"
psql -h <hostname> -U <username> -d mi_base_datos -c "\COPY tblDoctor FROM '/ruta/local/tblDoctor.csv' DELIMITER ',' CSV HEADER;"
psql -h <hostname> -U <username> -d mi_base_datos -c "\COPY tblEpisode FROM '/ruta/local/tblEpisode.csv' DELIMITER ',' CSV HEADER;"
