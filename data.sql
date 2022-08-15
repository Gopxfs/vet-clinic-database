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

insert into vets (name, age, date_of_graduation) values ('William Tatcher', 45, 'Apr 4, 1981'), ('Maisy Smith', 26, 'Jan 17, 2019'), ('Stephanie Mendez', 64, 'May 4, 1981'), ('Jack Harkness', 38, 'Jun 8, 2008');
insert into specialization values (1, true, false), (2, false, false), (3, true, true) (4, false, true);

insert into visits select animals.id, vets.id, 'May 24, 2020' from animals join vets on vets.name='William Tatcher' and animals.name='Agumon';
insert into visits select animals.id, vets.id, 'Jul 22, 2020' from animals join vets on vets.name='Stephanie Mendez' and animals.name='Agumon';

insert into visits select animals.id, vets.id, 'Feb 2, 2021' from animals join vets on vets.name='Jack Harkness' and animals.name='Gabumon';

insert into visits select animals.id, vets.id, 'Jan 5, 2020' from animals join vets on vets.name='Maisy Smith' and animals.name='Pikachu';
insert into visits select animals.id, vets.id, 'Mar 8, 2020' from animals join vets on vets.name='Maisy Smith' and animals.name='Pikachu';
insert into visits select animals.id, vets.id, 'May 14, 2020' from animals join vets on vets.name='Maisy Smith' and animals.name='Pikachu';

insert into visits select animals.id, vets.id, 'May 4, 2021' from animals join vets on vets.name='Stephanie Mendez' and animals.name='Devimon';

insert into visits select animals.id, vets.id, 'Feb 24, 2021' from animals join vets on vets.name='Jack Harkness' and animals.name='Charmander';

insert into visits select animals.id, vets.id, 'Dec 21, 2019' from animals join vets on vets.name='Maisy Smith' and animals.name='Plantmon';
insert into visits select animals.id, vets.id, 'Aug 10, 2020' from animals join vets on vets.name='William Tatcher' and animals.name='Plantmon';
insert into visits select animals.id, vets.id, 'Apr 7, 2021' from animals join vets on vets.name='Maisy Smith' and animals.name='Plantmon';

insert into visits select animals.id, vets.id, 'Sep 29, 2019' from animals join vets on vets.name='Stephanie Mendez' and animals.name='Squirtle';

insert into visits select animals.id, vets.id, 'Oct 3, 2020' from animals join vets on vets.name='Jack Harkness' and animals.name='Angemon';
insert into visits select animals.id, vets.id, 'Nov 4, 2020' from animals join vets on vets.name='Jack Harkness' and animals.name='Angemon';

insert into visits select animals.id, vets.id, 'Jan 24, 2019' from animals join vets on vets.name='Maisy Smith' and animals.name='Boarmon';
insert into visits select animals.id, vets.id, 'May 15, 2019' from animals join vets on vets.name='Maisy Smith' and animals.name='Boarmon';
insert into visits select animals.id, vets.id, 'Feb 27, 2020' from animals join vets on vets.name='Maisy Smith' and animals.name='Boarmon';
insert into visits select animals.id, vets.id, 'Aug 3, 2020' from animals join vets on vets.name='Maisy Smith' and animals.name='Boarmon';

insert into visits select animals.id, vets.id, 'May 24, 2020' from animals join vets on vets.name='Stephanie Mendez' and animals.name='Blossom';
insert into visits select animals.id, vets.id, 'Jan 11, 2021' from animals join vets on vets.name='William Tatcher' and animals.name='Blossom';

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
