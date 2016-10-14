--create make table

CREATE TABLE car_make (
  P_id SERIAL NOT NULL,
  code character varying(125),
  title character varying(125),
  PRIMARY KEY (P_id)
);

--create model table

CREATE TABLE car_model (
  F_id integer,
  code character varying(125),
  title character varying(125),
  year integer,
  FOREIGN KEY (F_id) REFERENCES car_make(P_id)
);

--insert data into car_make table



--insert data into car_model table



--Queries???!?!?!?!