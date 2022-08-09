/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
ID INT PRIMARY KEY NOT NULL,
name text,
date_of_birth date,
escape_attempts int,
neutered bit,
weight_kg decimal,
species text
);

