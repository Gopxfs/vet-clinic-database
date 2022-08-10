/* Populate database with sample data. */

INSERT INTO animals VALUES (
1,
'Agumon',
'Feb 3, 2020',
0,
'1',
20.23);

INSERT INTO animals VALUES (
2,
'Gabumon',
'Nov 15, 2018',
2,
'1',
8);

INSERT INTO animals VALUES (
3,
'Pikachu',
'Jan 7, 2021',
1,
'0',
15.04);

INSERT INTO animals VALUES (
4,
'Devimon',
'May 12, 2017',
5,
'1',
11);

INSERT INTO animals VALUES (
5,
'Charmander',
'Feb 8, 2020',
0,
'0',
-11,
''
);

INSERT INTO animals VALUES (
6,
'Plantmon',
'Nov 15, 2021',
2,
'1',
-5.7,
''
);

INSERT INTO animals VALUES (
7,
'Squirtle',
'Apr 2, 1993',
3,
'0',
-12.13,
''
);

INSERT INTO animals VALUES (
8,
'Angemon',
'Jun 12, 2005',
1,
'1',
-45,
''
);

INSERT INTO animals VALUES (
9,
'Boarmon',
'Jun 7, 2005',
7,
'1',
20.4,
''
);

INSERT INTO animals VALUES (
10,
'Blossom',
'Oct 13, 1998',
3,
'1',
17,
''
);

INSERT INTO animals VALUES (
11,
'Ditto',
'May 14, 2022',
4,
'1',
22,
''
);

BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT species from animals;
ROLLBACK;
SELECT species from animals;

BEGIN;
UPDATE animals SET species = 'Digimon' WHERE name LIKE '%mon%'; 
UPDATE animals SET species = 'Pokemon' WHERE name NOT LIKE '%mon%'; 
SELECT species from animals;
COMMIT;
SELECT species from animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM ANIMALS;
ROLLBACK;
SELECT * FROM ANIMALS;

BEGIN;
DELETE FROM animals WHERE date_of_birth >= '2022-01-01' ;
SAVEPOINT rip_ditto;
UPDATE animals SET weight_kg = weight_kg * -1; 
ROLLBACK TO rip_ditto;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 
COMMIT;
