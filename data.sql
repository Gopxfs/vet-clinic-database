/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'Agumon',
'Feb 3, 2020',
0,
'1',
20.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'Gabumon',
'Nov 15, 2018',
2,
'1',
8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'Pikachu',
'Jan 7, 2021',
1,
'0',
15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'Devimon',
'May 12, 2017',
5,
'1',
11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'Charmander',
'Feb 8, 2020',
0,
'0',
-11
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'Plantmon',
'Nov 15, 2021',
2,
'1',
-5.7
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'Squirtle',
'Apr 2, 1993',
3,
'0',
-12.13
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'Angemon',
'Jun 12, 2005',
1,
'1',
-45
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'Boarmon',
'Jun 7, 2005',
7,
'1',
20.4
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'Blossom',
'Oct 13, 1998',
3,
'1',
17
);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (
'Ditto',
'May 14, 2022',
4,
'1',
22
);

BEGIN transaction;
UPDATE animals
SET species = 'unspecified';
SELECT species from animals;
ROLLBACK;
SELECT species from animals;

BEGIN transaction;
UPDATE animals SET species = 'Digimon' WHERE name LIKE '%mon%'; 
UPDATE animals SET species = 'Pokemon' WHERE name NOT LIKE '%mon%'; 
SELECT species from animals;
COMMIT;
SELECT species from animals;

BEGIN transaction;
DELETE FROM animals;
SELECT * FROM ANIMALS;
ROLLBACK;
SELECT * FROM ANIMALS;

BEGIN transaction;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01' ;
SAVEPOINT rip_ditto;
UPDATE animals SET weight_kg = weight_kg * -1; 
ROLLBACK TO rip_ditto;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 
COMMIT;

alter table animals drop column species;
alter table animals add column species_id int;
alter table animals add constraint fk_species foreign key (species_id) references species(id);
alter table animals add column owners_id int;
alter table animals add constraint fk_onwers foreign key (owners_id) references owners(id);

insert into owners (full_name, age) values ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob',45), ('Melody Pond', 77), ('Dean Winchester', 14), ('Jodie Whittaker', 38);
insert into species (name) values ('Pokemon'), ('Digimon');

update animals set species_id = 2 where name like '%mon%';
update animals set species_id = 1 where name not like '%mon%';

update animals set owners_id = 1 where name = 'Agumon';
update animals set owners_id = 2 where name = 'Gabumon' or name = 'Pikachu';
update animals set owners_id = 3 where name = 'Devimon' or name = 'Plantmon';
update animals set owners_id = 4 where name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';
update animals set owners_id = 5 where name = 'Angemon' or name = 'Boarmon';
