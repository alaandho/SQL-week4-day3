--1. List all customers who live in Texas (use JOINs)
--answer: Jenner Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still
SELECT first_name, last_name, district
FROM address
JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'Texas';


--2. Get all payments above $6.99 with the Customer's Full Name
--answer: There are 1,406 data payment outputs above $6.99 with customer's full name
SELECT first_name, last_name, amount
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;


--3. Show all customers names who have made payments over $175(use subqueries)
--answer: Rhonda Kennedy, Clara Shaw, Eleanor Hunt, Marion Snyder, Tommy Collazo, Karl Seal
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id 
	HAVING SUM(amount) > 175
);


--4. List all customers that live in Nepal (use the city table)
--answer: Kevin Schuler
--customer, address_id -> address, address_id, city_id -> city, address.city_id, city_id, country_id -> country, country_id
SELECT first_name, last_name, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';


--5. Which staff member had the most transactions?
--answer: Jon Stephens with 7304 transactions
SELECT first_name, last_name, staff.staff_id, COUNT(payment.staff_id)
FROM staff
JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id;


--6. How many movies of each rating are there?
--answer: PG-13:223, NC-17:210, R:195, PG:194, G:178
SELECT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY COUNT(title) DESC;


--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
--answer: 130 customers
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id, amount > 6.99
	HAVING COUNT(amount) = 1
);


--8.How many free rentals did our stores give away?
--answer: 24
SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00


















