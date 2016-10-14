/*DROP TABLE IF EXISTS car_model;
DROP TABLE IF EXISTS car_make;

CREATE TABLE car_make (
  P_id SERIAL NOT NULL,
  code CHARACTER VARYING(125),
  title CHARACTER VARYING(125),
  PRIMARY KEY (P_id)
);

CREATE TABLE car_model (
  F_id INTEGER,
  code CHARACTER VARYING(125),
  title CHARACTER VARYING(125),
  year INTEGER,
  FOREIGN KEY (F_id) REFERENCES car_make(P_id)
);

INSERT INTO car_make(code, title)
SELECT DISTINCT make_code, make_title
FROM car_models
ORDER BY make_title ASC;

SELECT * FROM car_make;*/


--------------------------------------------------

DROP TABLE IF EXISTS make;
DROP TABLE IF EXISTS models;

CREATE TABLE make (
  make_code CHARACTER VARYING(125) NOT NULL,
  make_title CHARACTER VARYING(125) NOT NULL,
  id SERIAL PRIMARY KEY
);

INSERT INTO make(make_code, make_title)
SELECT DISTINCT make_code, make_title
FROM car_models;

CREATE TABLE models (
  id SERIAL PRIMARY KEY,
  model_code CHARACTER VARYING(125) NOT NULL,
  model_title CHARACTER VARYING(125) NOT NULL,
  year integer NOT NULL,
  make_id integer REFERENCES make (id)
);

INSERT INTO models(model_code, model_title, year, make_id)
SELECT DISTINCT model_code, model_title, year, make_id
FROM car_models INNER JOIN make ON (make.make_code = car_models.make_code);

SELECT DISTINCT make_title FROM car_models;

SELECT DISTINCT model_title FROM car_models WHERE make_code = 'VOLKS';

SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code = 'LAM';

SELECT * FROM car_models WHERE year BETWEEN 2010 and 2015;