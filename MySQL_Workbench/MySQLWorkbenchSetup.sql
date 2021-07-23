use twitter;

SELECT *
FROM users;

INSERT INTO users (first_name, last_name, handle, birthday, created_at ) 
VALUES('Nicolas', 'Anguita', 'nanguita', '1984-03-27', NOW());

UPDATE users SET updated_at = NOW(), last_name='Cari' WHERE id = 6;

DELETE FROM users WHERE id =7 or id=8;

SELECT *
FROM users;