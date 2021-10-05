/* Database schema to keep the structure of entire database. */


 CREATE TABLE owners(
 id INT GENERATED ALWAYS AS IDENTITY,
 age INT NOT NULL,
 full_name TEXT NOT NULL,
 PRIMARY KEY(id));

 CREATE TABLE species(
 id INT GENERATED ALWAYS AS IDENTITY,
 name TEXT NOT NULL,
 PRIMARY KEY(id));

 CREATE TABLE animals(
 id INT GENERATED ALWAYS AS IDENTITY,
 name TEXT NOT NULL,
 date_of_birth date NOT NULL,
 escape_attempts INT NOT NULL,
 neutered BOOL NOT NULL,
 weight_kg REAL NOT NULL,
 PRIMARY KEY(id)
);

ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD owner_id INT; 
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id); 
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
age INT,
date_of_graduation  DATE,
PRIMARY KEY(id)
);

CREATE TABLE specialization (
species_id INT,
vets_id INT,
FOREIGN KEY (species_id) REFERENCES species (id),
FOREIGN KEY (vets_id) REFERENCES vets (id),
PRIMARY KEY (species_id, vets_id)
);

CREATE TABLE visits (
animals_id INT,
vets_id INT,
date_of_visit DATE,
id INT GENERATED ALWAYS AS IDENTITY,
FOREIGN KEY (animals_id) REFERENCES animals (id),
FOREIGN KEY (vets_id) REFERENCES vets (id),
PRIMARY KEY (id)
);
