-- LABORATORY WORK 3
-- BY Haluha_Bohdan
/*1.Написати pl/sql код, що додає 10 покупців у циклі з ключами с1...с10. Кожному з
цих покупців додає по одному замовленнюю. Ключі нових замовлень - ord1....ord10. Дата цих замовлень
відповідає даті замовлення з номером 20005. 10 балів*/

    

/*Написати PL/SQL код, що по вказаному ключу постачальника виводить у консоль його ім'я та визначає його статус
якщо він має більше = 10 продуктів - статус "більше 10"
якщо він продав менше 10 продуктів - статус = кількість продуктів (число)
4 бали
*/

DECLARE
  count_of_orders INTEGER := 0;

CREATE VIEW orders_vendors AS 
  SELECT
    vendors.vend_id,
    vendors.vend_name
    FROM 
      vendors 
      JOIN
      orders
      ON
      orders.cust_id=vendors.cust_id
      
SELECT
  vend_id,
  vend_name,
  COUNT(DISTINCT vend_id)
  FROM
    orders_vendors
  GROUP BY
    vend_id,
    vend_name;
  
BEGIN
  SELECT
    COUNT(*) INTO count_of_orders
    FROM
      ORDERS;
    IF(count_of_customers >= 10) THEN
      DBMS_OUTPUT.PUT_LINE('MORE THAN 10');
    ELSE
      DBMS_OUTPUT.PUT_LINE('count of orders: '||count_of_orders);
    END IF;
    
END;



/*3. Створити представлення та використати його у двох запитах:
3.1.Вивести номери замовлення та кількість різних продуктів у цих замовленннях
3.2.Вивести ім'я постачальника та номери замовлень, куди він продавав свої продукти .
6 балів
*/

CREATE VIEW customers_vendors AS 
  SELECT
    customers.cust_id,
    customers.cust_name
    FROM 
      customer 
      JOIN
      orders
      ON
      orders.cust_id=customers.cust_id
      JOIN
      orders
      ON
      orders.cust_id=customers.cust_id

/*3.1*/
SELECT
  cust.id,
  cust.name,
  COUNT(DISTINCT vend_id)
  FROM
    customers_vendors
  GROUP BY
    cust_id,
    cust_name;
    
/*3.2*/
SELECT 
  vend_name
FROM
  customers_vendors
WHERE
  cust_id = "1000005"
