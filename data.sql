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

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 3);

INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age)
VALUES ('Bob', 45);

INSERT INTO owners (full_name, age)
VALUES ('Melody Pond', 77); 

INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker', 38);

/*Species Data*/

INSERT INTO species (name)
VALUES ('Pokemon');

INSERT INTO species (name)
VALUES ('Digimon');

/*Update Animals*/

UPDATE animals 
SET animals.species_id = species_id
FROM animals, species 
WHERE animals.name LIKE '%mon' AND species.name = "Digimon";  /*give all the animals that en in "mon" the Digimon species*/

UPDATE animals 
SET animals.species_id = species_id
FROM animals, species 
WHERE animals.name = NULL AND species.name = "Pokemon"; /*Give the remaning ones the pokemon status*/


UPDATE animals 
SET animals.owner_id = owners.id
FROM animals, owners 
WHERE animals.name = 'Agumon' AND owners.name = "Sam Smith"; /*giving animals to their respective owners*/

UPDATE animals 
SET animals.owner_id = owners.id
FROM animals, owners 
WHERE animals.name IN ('Gabumon', 'Pikachu') AND owners.name = "Jennifer Orwell";

UPDATE animals 
SET animals.owner_id = owners.id
FROM animals, owners 
WHERE animals.name IN ('Devimon', 'Plantmon') AND owners.name = "Bob";

UPDATE animals 
SET animals.owner_id = owners.id
FROM animals, owners 
WHERE animals.name IN ('Charmander', 'Squirtle', 'Blossom') AND owners.name = "Melody Pond";

UPDATE animals 
SET animals.owner_id = owners.id
FROM animals, owners 
WHERE animals.name IN ('Angemon', 'Boarmon') AND owners.name = "Dean Winchester";

/*Vets Data*/

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-4-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-17-1');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-4-5');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-8-6');

/*Specialization data*/

INSERT INTO specialization (vets_id, species_id) VALUES (1, 1);
INSERT INTO specialization (vets_id, species_id) VALUES (3, 2);
INSERT INTO specialization (vets_id, species_id) VALUES (3, 1);
INSERT INTO specialization (vets_id, species_id) VALUES (4, 2);

/* insert date*/

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (1, 1, '2020-5-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (1, 3, '2020-7-22');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (2, 4, '2021-2-2');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, '2020-1-5');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, '2020-3-8');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, '2020-5-14');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (4, 3, '2021-5-4');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (5, 4, '2021-2-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 2, '2019-12-21');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 1, '2020-8-10');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 2, '2021-4-7');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (7, 3, '2019-9-29');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 4, '2020-10-3');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 4, '2020-11-4');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, '2019-1-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, '2019-5-15');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, '2020-2-27');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, '2020-8-3');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (10, 3, '2020-5-24');
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (10, 1, '2021-1-11');