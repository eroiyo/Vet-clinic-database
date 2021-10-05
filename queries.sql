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


/*-------------- Milestone 2: Write queries to answer the following questions --------------*/

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

/*-------------- Milestone 3: Query multiple tables --------------*/

/*modify your inserted animals to include owner information (owner_id)*/

/*What animals belong to Melody Pond?*/

SELECT animals.name, owners.full_name FROM animals
    INNER JOIN owners
    ON owners.id = animals.owner_id
    AND owners.full_name = 'Melody Pond';

/*List of all animals that are pokemon (their type is Pokemon).*/

SELECT animals.name, species.name FROM animals
    INNER JOIN species
    ON species.id = animals.species_id
    AND species.name = 'Pokemon';

/*List all owners and their animals, remember to include those that don't own any animal.*/

SELECT owners.full_name, animals.name FROM owners
    LEFT JOIN animals
    ON owners.id = animals.owner_id;

/*How many animals are there per species?*/

SELECT species.name, COUNT(*) FROM animals
    FULL OUTER JOIN species
    ON species.id = animals.species_id
    GROUP BY species.id;

/*List all Digimon owned by Jennifer Orwell.*/

SELECT animals.name, species.name FROM animals
    INNER JOIN owners ON owners.id = animals.owner_id
    INNER JOIN species ON species.id = animals.species_id
    WHERE owners.full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';

/*List all animals owned by Dean Winchester that haven't tried to escape*/

SELECT animals.name, animals.escape_attempts FROM animals
    INNER JOIN owners ON owners.id = animals.owner_id
    WHERE owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;

/*Who owns the most animals?*/

SELECT owners.full_name, COUNT(animals.owner_id) FROM animals 
FULL OUTER JOIN owners 
ON animals.owner_id = owners.id
GROUP BY owners.id;

/*--------------------------------------------------- Join Table ---------------------------------------------*/


/*-Who was the last animal seen by William Tatcher?-*/
SELECT animals.name, visits.date_of_visit AS last_visit FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'William Tatcher'
GROUP BY animals.name, visits.date_of_visit
ORDER BY last_visit DESC LIMIT 1;

/*How many different animals did Stephanie Mendez see?*/
SELECT COUNT(DISTINCT visits.animals_id) FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
WHERE vets.name = 'Stephanie Mendez';

/*List all vets and their specialties, including vets with no specialties.*/
SELECT vets.name, species.name FROM vets 
LEFT JOIN specialization ON specialization.vets_id = vets.id
LEFT JOIN species ON species.id = specialization.species_id;

/*List all animals that visited Stephanie Mendez between 2020-1-1 and 2020-8-30 */
SELECT animals.name, visits.date_of_visit FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Stephanie Mendez'
AND visits.date_of_visit BETWEEN '2020-1-1' AND '2020-8-30';

/*What animal has the most visits to vets?*/
SELECT animals.name, COUNT(visits.animals_id) AS visit_count FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
GROUP BY animals.name, visits.animals_id
ORDER BY visit_count DESC LIMIT 1;

/*Who was Maisy Smith's first visit*/
SELECT animals.name, visits.date_of_visit AS first_visit FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
WHERE vets.name = 'Maisy Smith'
GROUP BY animals.name, visits.date_of_visit
ORDER BY first_visit LIMIT 1;

/*Details for most recent visit: animal information, vet information, and date of visit*/
SELECT * FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
ORDER BY visits.date_of_visit DESC LIMIT 1;

/*How many visits were with a vet that did not specialize in that animal's species?*/
SELECT COUNT(visits.animals_id) FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
INNER JOIN specialization ON specialization.vets_id = vets.id
WHERE specialization.species_id <> animals.species_id;

/*What specialty should Maisy Smith consider getting? Look for the species she gets the most.*/
SELECT species.name, COUNT(visits.animals_id) AS species_count FROM visits
INNER JOIN vets ON vets.id = visits.vets_id
INNER JOIN animals ON animals.id = visits.animals_id
INNER JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY species_count DESC LIMIT 1;

/* Performace Audit testing querys */

explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;
explain analyze SELECT * FROM visits where vets_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com'; 
