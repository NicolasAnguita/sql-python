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
SELECT COUNT(*)
FROM users u
JOIN friendships f ON u.id = f.user_id;

-- Descubre quién tiene más amigos y devuelve el recuento de sus amigos.

SELECT u.id, u.first_name, u.last_name, COUNT(u.id)
FROM users u
JOIN friendships f ON u.id = f.user_id
JOIN users as v ON f.friend_id = v.id
GROUP BY u.id
ORDER BY COUNT(u.id) DESC
LIMIT 1;

-- Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
INSERT INTO `friends`.`users` (`id`, `first_name`, `last_name`) VALUES ('6', 'Nicolas', 'Anguita');

INSERT INTO friendships (friendships.user_id, friendships.friend_id, friendships.created_at) VALUES (6, 2, NOW());
INSERT INTO friendships (friendships.user_id, friendships.friend_id, friendships.created_at) VALUES (6, 4, NOW());
INSERT INTO friendships (friendships.user_id, friendships.friend_id, friendships.created_at) VALUES (6, 5, NOW());

-- Devuelve a los amigos de Eli en orden alfabético.
SELECT v.first_name as friend_fn, v.last_name as friend_ln
FROM users u
JOIN friendships f ON u.id = f.user_id
JOIN users as v ON f.friend_id = v.id
WHERE u.id = 2
ORDER BY v.last_name;


-- Eliminar a Marky Mark de los amigos de Eli.

DELETE FROM friendships
WHERE user_id = 2 AND friend_id = 5;


-- Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos

SELECT u.first_name, u.last_name, v.first_name as friend_fn, v.last_name as friend_ln
FROM users u
JOIN friendships f ON u.id = f.user_id
JOIN users as v ON f.friend_id = v.id;
