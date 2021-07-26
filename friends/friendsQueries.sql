USE `friends`;

SELECT u.first_name, u.last_name, v.first_name as friend_first_name, v.last_name as friend_last_name
FROM users u 
JOIN friendships f ON u.id = f.user_id
JOIN users as v ON v.id = f.friend_id;
-- WHERE v.id IS NOT NULL;

/* Devuelva a todos los usuarios que son amigos de Kermit, 
asegúrese de que sus nombres se muestren en los resultados.*/

SELECT u.first_name, u.last_name, v.first_name as friend_first_name, v.last_name as friend_last_name
FROM users u 
LEFT JOIN friendships f ON u.id = f.user_id
RIGHT JOIN users as v ON v.id = f.friend_id
WHERE v.id = 4 OR u.id = "4";


-- Devuelve el recuento de todas las amistades
SELECT u.first_name, u.last_name, 
FROM users u 
JOIN friendships f ON u.id = f.user_id
JOIN users as v ON v.id = f.friend_id;
-- GROUP BY u.id;



-- Descubre quién tiene más amigos y devuelve el recuento de sus amigos.

-- Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.

-- Devuelve a los amigos de Eli en orden alfabético.

-- Eliminar a Marky Mark de los amigos de Eli.

-- Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos

