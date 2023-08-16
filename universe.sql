CREATE DATABASE universe;

CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY, name VARCHAR(20) UNIQUE NOT NULL);

CREATE TABLE star(star_id SERIAL PRIMARY KEY, name VARCHAR(20) UNIQUE NOT NULL);
ALTER TABLE star ADD COLUMN galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id);

CREATE TABLE planet(planet_id SERIAL PRIMARY KEY, name VARCHAR(20) UNIQUE NOT NULL);
ALTER TABLE planet ADD COLUMN star_id INT NOT NULL REFERENCES star(star_id);

CREATE TABLE moon(moon_id SERIAL PRIMARY KEY, name VARCHAR(20) UNIQUE NOT NULL);
ALTER TABLE moon ADD COLUMN planet_id INT NOT NULL REFERENCES planet(planet_id);


CREATE TABLE environment_data(environment_id SERIAL PRIMARY KEY, environment VARCHAR(20) NOT NULL);

CREATE TABLE environments(environment VARCHAR(20) NOT NULL);
ALTER TABLE environments ADD COLUMN planet_id INT NOT NULL REFERENCES planet(planet_id);
ALTER TABLE environments ADD COLUMN environment_id INT NOT NULL REFERENCES environment_data(environment_id);

INSERT INTO galaxy(name) VALUES("Milky Way"),("Sunflower Galaxy"),("Cigar Galaxy"),
("Messier 83"),("Malin 1"),("Tadpole Galaxy");

INSERT INTO star(name, galaxy_id) VALUES("The Sun", 1),("Sirius",2),("Aldebaran", 3),
("Polaris", 4),("UY Scuti", 5),("Altair", 6);

INSERT INTO planet(name, star_id) VALUES("Mercury", 1),("Venus",1),("Earth",1),
("Mars",1),("Jupiter",1),("Saturn",1),("Uranus",1),("Neptune",1),("Pluto",1),
("CoRoT-7b",3),("Enceladus",4),("Kepler-22b",5);

INSERT INTO moon(name, planet_id) VALUES("The Moon", 1),("Ganymede",5),("Europa",5),
("Titan",6),("Callisto",5),("Enceladus",6),("Mimas",6),("Triton",8),("Tethys",6),
("Dione",6),("Rhea",6),("Amalthea",5),("Lapetus",6),("Lo",5)
,("Elara",5),("Thebe",5),("Carme",5),("Hyperion",6)
,("Charon",9),("Titania",7);

ALTER TABLE planet ADD COLUMN description TEXT;
ALTER TABLE planet ADD COLUMN has_life BOOLEAN;
ALTER TABLE planet ADD COLUMN age_in_millions_of_years NUMERIC;
ALTER TABLE planet ADD COLUMN size_in_kms INT;
ALTER TABLE planet ADD COLUMN population INT;

ALTER TABLE galaxy ADD COLUMN size_in_kms INT;
ALTER TABLE galaxy ADD COLUMN has_life BOOLEAN;
ALTER TABLE galaxy ADD COLUMN description TEXT;

ALTER TABLE star ADD COLUMN size_in_kms INT;
ALTER TABLE star ADD COLUMN age_in_millions_of_years NUMERIC;
ALTER TABLE star ADD COLUMN description TEXT;

ALTER TABLE moon ADD COLUMN size_in_kms INT;
ALTER TABLE moon ADD COLUMN description TEXT;
