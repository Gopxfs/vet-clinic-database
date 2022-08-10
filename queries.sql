/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon%';
select name from animals where date_of_birth > '2016-12-31' and date_of_birth < '2019-01-01';
select name from animals where neutered = '1' and escape_attempts < 3;
select date_of_birth from animals where name = 'Pikachu' or name = 'Agumon';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = '1';
select * from animals where name != 'Gabumon';
select * from animals where weight_kg >= 10.4 and weight_kg <= 17.3;

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;

select avg(escape_attempts) from animals where neutered = '0';
select avg(escape_attempts) from animals where neutered = '1';
select avg(escape_attempts) from animals where species = 'Digimon' and date_of_birth > '1990-01-01' and date_of_birth < '2000-01-01';
select avg(escape_attempts) from animals where species = 'Pokemon' and date_of_birth > '1990-01-01' and date_of_birth < '2000-01-01';

select avg(weight_kg) from animals;
select min(weight_kg) from animals where name like '%mon%';
select max(weight_kg) from animals where name like '%mon%';
select min(weight_kg) from animals where name not like '%mon%';
select max(weight_kg) from animals where name not like '%mon%';

select animals.name from animals join owners on owners.id = 4 and animals.owners_id = 4;
select animals.name from animals join species on species.id = animals.species_id where species.name = 'Pokemon';
select owners.full_name, animals.name from owners left join animals on owners.id = animals.owners_id;
select count(animals.species_id),species.name from animals join species on animals.species_id = species.id group by animals.species_id,species.name;
select animals.name from animals join species on species.id = 2 and animals.species_id = 2 join owners on owners.full_name = 'Jennifer Orwell' and animals.owners_id = 2;
select animals.name from animals join owners on owners.id = animals.owners_id where owners.full_name = 'Dean Winchester' and escape_attempts = 0;
select owners.full_name, count(owners.full_name) from owners left join animals on owners.id = animals.owners_id group by owners.full_name order by count desc;

