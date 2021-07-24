USE `world`;

SELECT * FROM countries;

/* obtener todos los países que hablan esloveno. Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma. 
Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente
*/

SELECT name, language, percentage  FROM countries
JOIN languages ON  languages.country_id = countries.id
WHERE languages.language = "slovene"
ORDER BY percentage DESC;

/*mostrar el número total de ciudades para cada país? Su consulta debe devolver el nombre del país y el número total de ciudades. 
Tu consulta debe organizar el resultado por el número de ciudades en orden descendente. 
*/

SELECT countries.name, COUNT(*) as cities FROM countries
JOIN cities ON countries.id = cities.country_id
GROUP BY countries.name
ORDER BY COUNT(*) DESC;

/* obtener todas las ciudades de México con una población de más de 500,000
Tu consulta debe organizar el resultado por población en orden descendente
*/

SELECT cities.name as name_ , cities.population, cities.country_id FROM cities
JOIN countries ON countries.id = cities.country_id
WHERE countries.name = 'Mexico'
ORDER BY population DESC;

/* obtener todos los idiomas en cada país con un porcentaje superior al 89%? 
Tu consulta debe organizar el resultado por porcentaje en orden descendente.
*/

SELECT countries.name, languages.language, languages.percentage FROM languages
JOIN countries ON countries.id = languages.country_id
WHERE languages.percentage > 89
ORDER BY languages.percentage DESC;

/*  obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000?  */

SELECT c.name, c.surface_area, c.population FROM countries c
WHERE c.surface_area < 501 AND c.population > 100000;

/* obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años? */

SELECT c.name, c.government_form, c.capital, c.life_expectancy FROM countries c
WHERE c.government_form = 'Constitutional Monarchy' AND c.capital > 200 AND c.life_expectancy > 75;

/* obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? 
La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población */

SELECT cou.name as country_name, c.name as city_name, c.district, c.population FROM cities c
JOIN countries cou ON cou.id = c.country_id
WHERE cou.name = 'Argentina' AND c.district = 'Buenos Aires' AND c.population>500000;

/* resumir el número de países en cada región? La consulta debe mostrar el nombre de la región y el número de países. 
Además, la consulta debe organizar el resultado por el número de países en orden descendente */

SELECT c.region , COUNT(c.name) AS countries FROM countries c
GROUP BY c.region
ORDER BY COUNT(c.name) DESC;

