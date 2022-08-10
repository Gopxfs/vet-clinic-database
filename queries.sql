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
select avg(weight_kg) from animals;
select avg(escape_attempts) from animals where neutered = '0';
select avg(escape_attempts) from animals where neutered = '1';
select min(weight_kg) from animals where name like '%mon%';
select max(weight_kg) from animals where name like '%mon%';
select min(weight_kg) from animals where name not like '%mon%';
select max(weight_kg) from animals where name not like '%mon%';
select avg(escape_attempts) from animals where species = 'Digimon' and date_of_birth > '1990-01-01' and date_of_birth < '2000-01-01';
select avg(escape_attempts) from animals where species = 'Pokemon' and date_of_birth > '1990-01-01' and date_of_birth < '2000-01-01';

