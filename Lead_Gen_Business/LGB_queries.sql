-- SELECT Date,TotalAllowance FROM Calculation WHERE EmployeeId=1 AND Date >= '2011/02/25' AND Date < '2011/02/28'      


-- 1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?

SELECT  MONTHNAME(b.charged_datetime) AS month, SUM(b.amount) AS revenue
FROM billing b
WHERE MONTHNAME(b.charged_datetime) = 'March' AND b.charged_datetime >= '2012/01/01' AND b.charged_datetime < '2012/12/30';

-- 2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?

SELECT b.client_id, SUM(b.amount) as total_revenue
FROM billing b
WHERE b.client_id = 2
GROUP BY b.client_id;

-- 3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10?

SELECT s.domain_name as website, s.client_id
FROM sites s
WHERE s.client_id = 10;

-- 4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? 
-- ¿Qué pasa con el cliente = 20

SELECT s.client_id, MONTHNAME(s.created_datetime) AS month_created, YEAR(s.created_datetime) AS year_created, COUNT(s.domain_name) AS number_of_web_sites
FROM sites s
WHERE s.client_id = 1
GROUP BY s.client_id, s.created_datetime;

SELECT s.client_id, MONTHNAME(s.created_datetime) AS month_created, YEAR(s.created_datetime) AS year_created, COUNT(s.domain_name) AS number_of_web_sites
FROM sites s
WHERE s.client_id = 20
GROUP BY s.client_id, s.created_datetime;

-- 5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales generados para cada uno de los sitios entre el 1 de enero de 2011 y el 15 de febrero de 2011?

SELECT s.domain_name as website, COUNT(l.leads_id) as number_of_leads
FROM leads l
JOIN sites s ON s.site_id = l.site_id
WHERE l.registered_datetime BETWEEN '2011/01/01' AND '2011/02/15'
GROUP BY l.site_id;

-- 6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011?

SELECT CONCAT(clients.first_name," ", clients.last_name) AS Cliente, COUNT(leads.leads_id) AS Cuenta_Leads
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
LEFT JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime >= "2011/01/01" AND leads.registered_datetime <= "2011/12/31"
GROUP BY clients.client_id
ORDER BY clients.client_id ASC;

-- 7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada cliente cada mes entre los meses 1 y 6 del año 2011?
-- NO FUNCIONA


-- 8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada uno de los sitios de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite esta consulta por ID de cliente. Presente una segunda consulta que muestre todos los clientes, los nombres del sitio y el número total de clientes potenciales generados en cada sitio en todo momento.

SELECT CONCAT(clients.first_name," ", clients.last_name) AS Cliente, sites.domain_name AS Dominio, COUNT(*) AS 'Total', sites.created_datetime AS 'Fecha Creada'
FROM leads
JOIN sites ON leads.site_id = sites.site_id
JOIN clients ON sites.client_id = clients.client_id
WHERE registered_datetime BETWEEN '2011/01/01' AND '2011/12/31'
GROUP BY sites.client_id, sites.site_id;

-- Solicite esta consulta por ID de cliente. Presente una segunda consulta que muestre todos los clientes, 
-- los nombres del sitio y el número total de clientes potenciales generados en cada sitio en todo momento.

SELECT CONCAT(clients.first_name," ", clients.last_name) AS Cliente, sites.domain_name as Website, COUNT(leads.leads_id) AS Total_Leads
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
LEFT JOIN leads on sites.site_id = leads.site_id
GROUP BY clients.client_id, sites.domain_name, sites.site_id
ORDER BY clients.client_id, sites.site_id;



-- 9. Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente para cada mes del año. Pídalo por ID de cliente.

SELECT CONCAT(clients.first_name," ", clients.last_name) AS Cliente, SUM(billing.amount) AS Total_Ingresos,
DATE_FORMAT(billing.charged_datetime, '%M') AS Mes, DATE_FORMAT(billing.charged_datetime, '%Y') AS Año
FROM billing
LEFT JOIN clients ON billing.client_id = clients.client_id
GROUP BY clients.client_id, Mes, Año
ORDER BY clients.client_id, Mes, Año;

-- 10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente. Agrupe los resultados para que cada fila muestre un nuevo cliente. Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT)

SELECT CONCAT(clients.first_name," ", clients.last_name) AS Cliente,
GROUP_CONCAT(sites.domain_name ORDER BY sites.domain_name DESC SEPARATOR " - ") AS Websites
FROM clients
LEFT JOIN sites ON clients.client_id = sites.client_id
GROUP BY clients.client_id;