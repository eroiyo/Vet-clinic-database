/* Database schema to keep the structure of entire database. */


 CREATE TABLE owners(
 id INT GENERATED ALWAYS AS IDENTITY,
 age INT NOT NULL,
 full_name TEXT NOT NULL);

 CREATE TABLE species(
 id INT GENERATED ALWAYS AS IDENTITY,
 name TEXT NOT NULL);

 CREATE TABLE animals(
 id INT GENERATED ALWAYS AS IDENTITY,
 name TEXT NOT NULL,
 date_of_birth date NOT NULL,
 escape_attempts INT NOT NULL,
 neutered BOOL NOT NULL,
 weight_kg REAL NOT NULL
);

ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD owner_id INT; 
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id); 
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);