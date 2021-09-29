/* Populate database with sample data. */


/**/

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Agumon', '2020-2-03', 10.23, true, 0);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Gabumon', '2018-11-15', 8, true, 2);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Pikachu', '2021-1-07', 15.04, false, 1);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Devimon', '2017-3-12', 10.23, true, 5);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Charmander', '2020-2-08', -11, false, 0);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Plantmon', '2022-11-15', -5.7, true, 2);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Squirtle', '1993-4-02', -12.3, false, 3);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Angemon', '2005-6-12', -45, true, 1);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Boarmon', '2005-6-7', 20.4, true, 7);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Blossom', '1998-10-13', 17, true, 3);


/*Owners Data*/

INSERT INTO animals (full_name, age)
VALUES ('Sam Smith', 3);

INSERT INTO animals (full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO animals (full_name, age)
VALUES ('Bob', 45);

INSERT INTO animals (full_name, age)
VALUES ('Melody Pond', 77); 

INSERT INTO animals (full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO animals (full_name, age)
VALUES ('Jodie Whittaker', 38);

/*Species Data*/

INSERT INTO species (name)
VALUES ('Pokemon');

INSERT INTO species (name)
VALUES ('Digimon');

/*Update Animals*/

UPDATE animals SET species_id = 1 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 2 WHERE species_id IS NULL;

UPDATE animals SET owner_id = 1 WHERE name LIKE 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');
