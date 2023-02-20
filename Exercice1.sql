/* display the number of movies by rating */
SELECT note, COUNT ( * ) AS number_of_movies
FROM the movie
GROUP BY ranking;


/* display movies whose rating is G or PG-13 and whose duration is less than 120 minutes and whose rental price is less than 3.00 */
SELECT * FROM movie
WHERE notation IN('G', 'PG-13')
AND length < 120
AND rental_rate < 3 . 00
ORDER BY ASC title;


/* modify customer information 123 */
UPDATE client
SET first name = 'Mamadou K', last name = 'Konaté', email = 'kmk@example.com'
WHERE client_id = 123;


/* modify the address of address 123 */

Update address
SET address = 'N' 'dotre, Abobo, Abidjan, Ivory Coast'
WHERE address_id = 123;


DELETE  *
Students
Or ();