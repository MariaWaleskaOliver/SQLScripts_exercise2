

#Assigment 2 Task 01 
#Here we JOIN the categories table and the products table and display the category name , products and list price in as ascentend order
USE my_guitar_shop;
SELECT category_name , product_name, list_price
FROM categories
NATURAL JOIN products
ORDER BY  category_name ASC, product_name ASC;

#Assigment 2 Task 02 
#Here we Join the Costuner and the addresses table, and returns only the the roles with the following email address. 
USE my_guitar_shop;
SELECT first_name , last_name , line1 , city , state , zip_code 
FROM customers
NATURAL JOIN addresses
WHERE email_address = "allan.sherwood@yahoo.com";

#Assigment 2 Task 03 
#Here we join costumer, orders, products, order_itemns table and order the resulte by the last name, date of order and the product name 
USE my_guitar_shop;
SELECT last_name, first_name, order_date, product_name, item_price, discount_amount, quantity
FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
ORDER BY last_name, order_date, product_name;

#Assigment 2 Task 04 
#Here we use self-Join to check if the productId is diferente an the listPrice is similar 
USE my_guitar_shop;
SELECT c1.product_id , c1.product_name, c1.list_price
FROM products c1
INNER JOIN  products c2
ON c1.list_price = c2.list_price
AND c1.product_id <> c2.product_id;

#Assigment 2 Task 05 
#He we use the UNION opetator to check if the item was shipped or not 
USE my_guitar_shop;
SELECT 'SHIPPED' AS ship_status, order_id, order_date
  FROM orders
  WHERE ship_date IS NOT NULL 
  UNION
  SELECT 'NOT SHIPPED', order_id, order_date
  FROM orders
  WHERE ship_date IS NULL
ORDER BY order_date;

############################################################

#Assigment 2 Part 2. Software Expert (SWE) Database

#Assigment 2 Task 01
# Here we retrieve the names of the cities which each consultat lives and do not diplay the duplicated results in alphabetical order 
USE swexpert;
SELECT DISTINCT c_city
FROM consultant
ORDER BY c_city ASC;

#Assigment 2 Task 02
# Here we display the projectsId and name that have a parent project 
USE swexpert;
SELECT p_id, project_name, parent_p_id
FROM project
WHERE parent_p_id IS NOT NULL;

#Assigment 2 Task 03
#Here we use self-join to display the projectId, name and it's parent's id 
USE swexpert;
SELECT p1.p_id, p1.project_name, p2.p_id, p2.project_name AS parent_name
FROM project AS p1
LEFT JOIN project AS p2
	ON p1.parent_p_id = p2.p_id;

#Assigment 2 Task 04
#Here we display the consultantId , skillId and certification, showing only the consultants that are certified, and order it by skillId and consultantId
USE swexpert;
SELECT c_id , skill_id, certification
FROM consultant_skill 
WHERE certification = 'y'
ORDER BY  skill_id ,c_id ;

#Assigment 2 Task 05
#Here we display a list of the consultantId, last name and first name, SkillDrescrption and Order by skillId and ConsultantId
USE swexpert;
SELECT c.c_id, c.c_last, c.c_first, cs.skill_id, s.skill_description
FROM consultant AS c
JOIN consultant_skill AS cs
	ON c.c_id = cs.c_id
JOIN skill AS s
	ON s.skill_id = cs.skill_id
WHERE cs.certification = 'Y'
ORDER BY s.skill_id, c.c_id;



