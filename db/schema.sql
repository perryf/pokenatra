DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS trainers;

CREATE TABLE trainers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  img_url VARCHAR(255),
  spunk INTEGER
);

CREATE TABLE pokemons (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  poke_type VARCHAR(255),
  cp INTEGER,
  img_url VARCHAR(255),
  trainer_id INTEGER REFERENCES trainers(id)
);
