DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE customers (
  name VARCHAR(225),
  funds INT4,
  id SERIAL4 PRIMARY KEY
);

CREATE TABLE films (
  title VARCHAR(225),
  price INT4,
  id SERIAL4 PRIMARY KEY
);

CREATE TABLE tickets (
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
  id SERIAL4 PRIMARY KEY
);
