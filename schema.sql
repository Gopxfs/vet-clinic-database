/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
ID INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
name text,
date_of_birth date,
escape_attempts int,
neutered bit,
weight_kg decimal,
species text
);

CREATE TABLE owners (
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
full_name text,
age int
);

CREATE TABLE species (
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
name text
);

CREATE TABLE vets (
id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY NOT NULL,
name text,
age int,
date_of_graduation date
);

CREATE TABLE specialization (
id int,
pokemon boolean,
digimon boolean
);

CREATE TABLE visits (
animal_id int,
vet_id int,
date_of_visit date
);

create index animal_id_asc on visits(animal_id asc);
create index vet_id_asc on visits(vet_id asc);

