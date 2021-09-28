/*Find all animals whose name ends in "mon".*/

SELECT * from animals WHERE name LIKE '%mon';

/*List the name of all animals born between 2016 and 2019.*/

SELECT (name) from animals WHERE date_of_birth BETWEEN "2016-1-1" AND "2019-12-31";

/*List the name of all animals that are neutered and have less than 3 escape attempts.*/

SELECT (name) from animals WHERE neutered = true AND escape_attempts < 3;

/*List date of birth of all animals named either "Agumon" or "Pikachu".*/

SELECT (date_of_birth) from animals WHERE name = "Agumon" OR "Pikachu";

/*List name and escape attempts of animals that weigh more than 10.5kg*/

SELECT (name, escape_attempts) from animals WHERE weight_kg > 10.5;

/*List all animals that are neutered.*/

SELECT * from animals WHERE neutered = false;

/*Find all animals not named Gabumon.*/

SELECT * from animals WHERE name != "Gabumon";

/*Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights 
that equals precisely 10.4kg or 17.3kg)*/

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/*-------------------------query and update animals table-------------------------*/

/*Inside a transaction update the animals table by setting the species column to unspecified.
 Verify that change was made. Then roll back the change and verify that species columns went back to
  the state before tranasction.
  */
BEGIN ;


UPDATE animals;

SET species = "unspecified";

SELECT * from animals;

ROLLBACK;

BEGIN;  /*Inside a transaction:*/

UPDATE animals  /*Update the animals table by setting the species
                  column to digimon for all animals that have a name ending in mon.*/

SET species = "digimon"

WHERE name LIKE '%mon';

UPDATE animals   /*Update the animals table by setting the species
                  column to pokemon for anything else.*/
SET species = "pokemon"

WHERE species != "digimon";

COMMIT;

SELECT * from animals; /*verify that species columns is changed after transiction*/

BEGIN;

DELETE FROM animals /*fake delete*/

ROLLBACK;

SELECT * from animals; /*verify everything is the same*/

BEGIN;
DELETE FROM animals WHERE date_of_birth > '1-1-2022';  /*Delete all animals born after Jan 1st, 2022.*/

SAVEPOINT delete_future_animals;  /*Create a savepoint for the transaction.*/

UPDATE animals   /*Update all animals' weight to be their weight multiplied by -1.*/

SET weight_kg = (weight_kg * -1);

ROLLBACK TO delete_future_animals; /*Rollback to the savepoint*/

UPDATE animals 

SET weight_kg = (weight_kg * -1)   /*Update all animals' weights that are negative to be their weight multiplied by -1./ */

WHERE weight_kg < 0; 

COMMIT;  /*Commit transaction*/


/*--------------Write queries to answer the following questions:--------------*/

/*How many animals are there?*/
SELECT COUNT(*) FROM animals;

/*How many animals have never tried to escape?*/

SELECT COUNT(*) FROM animals 

WHERE escape_attempts = 0;

/*What is the average weight of animals?*/
SELECT AVG(weight_kg) FROM animals;

/*Who escapes the most, neutered or not neutered animals?*/
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

/*What is the minimum and maximum weight of each type of animal?*/
SELECT neutered, MIN(weight_kg), MAX(weight_kg) from animals GROUP BY species;

/*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/
SELECT neutered, AVG(escape_attempts) FROM animals WHERE EXTRACT(year FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;
