//5.1
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE employee_id IN(SELECT DISTINCT manager_id FROM employees);

//5.2 Creer une vue qui organise les employees par le nombre de ventes ascendant.
CREATE VIEW ventes_par_employees AS
SELECT salesman_id as salesman_id, COUNT(order_id) as sales_num
FROM orders 
GROUP BY salesman_id
ORDER BY COUNT(order_id) ASC;

//5.2. Affiche le nombre de ventes par employees. La présence de la 2e ligne dépend de l'interpretation de la question
SELECT * FROM ventes_par_employees
WHERE salesman_id IS NOT NULL;

//5.2. Affiche l'employee avec le plus grand nombre de ventes
SELECT salesman_id, sales_num
FROM ventes_par_employees
WHERE sales_num IN (SELECT MAX(sales_num) FROM ventes_par_employees);

//5.3
SELECT product_id FROM inventories
WHERE product_id NOT IN(SELECT product_id FROM order_items);
