#setting up table
#terminal ->
#psql -d pizza_shop -f db/pizza_shop.sql

CREATE TABLE pizzas(
  id SERIAL4 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  topping VARCHAR(255),
  quantity INT2
);
