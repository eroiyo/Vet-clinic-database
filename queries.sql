/*List all animals that are neutered.*/

SELECT * from animals WHERE neutered = false;

/*Find all animals not named Gabumon.*/

SELECT * from animals WHERE name != "Gabumon";

/*Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights 
that equals precisely 10.4kg or 17.3kg)*/

SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*List name and escape attempts of animals that weigh more than 10.5kg*/

SELECT (name, escape_attempts) from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;