/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals(
 id INT PRIMARY KEY NOT NULL,
 name TEXT NOT NULL,
 date_of_birth date NOT NULL,
 escape_attempts INT NOT NULL,
 neutered BOOL NOT NULL,
 weight_kg REAL NOT NULL,
 species TEXT NOT NULL);
