USE sakila;

/* ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312? 
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente. */

SELECT a.city_id, ci.city, cu.first_name, cu.last_name, cu.email, a.address FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
WHERE ci.city_id=312;

/*¿Qué consulta harías para obtener todas las películas de comedia? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).*/

SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, ca.name as genre 
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category ca ON ca.category_id = fc.category_id
WHERE ca.name = 'Comedy';


/*¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? 
Su consulta debe devolver la identificación del actor, el nombre del actor, el título de la película, la descripción y el año de lanzamiento.*/

SELECT a.actor_id, CONCAT(a.first_name, " ", a.last_name), fa.film_id, f.title, f.description, f.release_year 
FROM film f
JOIN film_actor fa  ON f.film_id = fa.film_id
JOIN actor a ON a.actor_id = fa.actor_id
WHERE a.actor_id = 5;


-- ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? 
-- Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente
-- no se por que no funciona

SELECT s.store_id, ci.city_id, c.first_name, c.last_name, c.email, a.address
FROM customer c
JOIN store s ON s.store_id = c.store_id
JOIN address a ON a.address_id = c.address_id
JOIN city ci ON ci.city_id = a.city_id
WHERE c.store_id = 1 AND ci.city_id = 1 OR c.store_id = 1 AND ci.city_id = 42  OR c.store_id = 1 AND ci.city_id =312 OR c.store_id = 1 AND ci.city_id =459;

/* ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por actor_id = 15? Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial. 
Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'. */

SELECT f.title as title, f.description, f.release_year, f.rating, f.special_features
FROM film f
JOIN film_actor fa ON fa.film_id = f.film_id
WHERE fa.actor_id = 15 AND f.rating = "G" AND f.special_features LIKE "%Behind the Scenes%" ;

/*¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? 
Su consulta debe devolver film_id, title, actor_id y actor_name.*/

SELECT f.film_id, f.title, a.actor_id, CONCAT (a.first_name, " ", a.last_name)
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.film_id = 369;


/*¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales y el género (categoría).*/

SELECT f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name as genre, f.rental_rate
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON c.category_id = fc.category_id
WHERE c.name = "Drama" AND f.rental_rate = 2.99;


/* ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? 
Su consulta debe devolver el título de la película, la descripción, el año de estreno, la calificación, las características especiales, el género (categoría) y el nombre y apellido del actor.*/

SELECT f.title, f.description, f.release_year, f.rating, f.special_features, c.name as genre, CONCAT(a.first_name, " ",a.last_name)
FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category c ON c.category_id = fc.category_id
JOIN film_actor fa ON fa.film_id = f.film_id
JOIN actor a ON a.actor_id = fa.actor_id
WHERE  c.name = "Action" AND a.first_name ="SANDRA" AND a.last_name = "KILMER";

