-- Create the items table
CREATE TABLE items (
   items_id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   description TEXT,
   price DECIMAL(10,2)
);

-- Create the customers table
CREATE TABLE customers (
   customers_id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   email VARCHAR(255),
   phoneVARCHAR(20)
);


-- Insert data into the "items" table
INSERT INTO items (items_id, name, description, price) VALUES
   (1, 'Small office', '', 100),
   (2, 'Large office', '', 300),
   (3, 'Fan', '', 80);

-- Insert data into the "customers" table
INSERT INTO customers (customers_id, name, email, phone) VALUES
   (1, 'Greg Jones', 'greg.jones@example.com', '555-1234'),
   (2, 'Sandra-Jones', 'sandra.jones@example.com', '555-5678'),
   (3, 'Scott Scott', 'scott.scott@example.com', '555-9101'),
   (4, 'Trevor Vert', 'trevor.vert@example.com', '555-1212'),
   (5, 'Melanie-Johnson', 'melanie.johnson@example.com', '555-1515');
  

-- Create the purchases table with the foreign keys
CREATE TABLE purchases (
   id SERIAL PRIMARY KEY,
   customers_id INT REFERENCES customers(customers_id),
   items_id INT REFERENCES items(items_id),
   quantity_purchased INT
);



-- Insert customer purchases
INSERT INTO purchases (customers_id, items_id, quantity_purchased) VALUES
   ((SELECT customers_id FROM customers WHERE name = 'Scott Scott'), (SELECT items_id FROM items WHERE name = 'Fan'), 1),
   ((SELECT customers_id FROM customers WHERE name = 'Melanie-Johnson'), (SELECT items_id FROM items WHERE name = 'Large Office'), 10),
   ((SELECT customers_id FROM customers WHERE name = 'Greg Jones'), (SELECT items_id FROM items WHERE name = 'Small office'), 2);


--Display items from the purchases table

SELECT * FROM purchases;

/*
   1. Display the name of all purchases and customers
*/

SELECT * FROM purchases
JOIN customers
ON purchases.customers_id = customers.customers_id;



/*
   Show name of all customers and name of all purchases for customer with id 5
*/

SELECT * FROM purchases
WHERE customers_id = 5;



/*display purchases where there is a large office and a small office*/

SELECT a.*
FROM purchases to
INNER JOIN items i1 ON a.items_id = i1.items_id AND i1.name = 'Large Office'
INNER JOIN items i2 ON a.items_id = i2.items_id AND i2.name = 'Small Office';




-- Display the first name of all customers
  
SELECT TRIM(SPLIT_PART(customers.name, ' ', 2)) AS first_name
FROM customers
INNER JOIN purchases ON customers.customers_id = purchases.customers_id;


--Display the name of all customers
SELECT SPLIT_PART(customers.name, ' ', 1) AS last_name
FROM customers
INNER JOIN purchases ON customers.customers_id = purchases.customers_id;

-- Show name of all purchases
  
SELECT items.name
FROM items
INNER JOIN purchases on items.items_id = purchases.items_id;


-- Insert purchase for customer with id 1 and without item_id
INSERT INTO purchases (customers_id, items_id) VALUES (1, NULL);