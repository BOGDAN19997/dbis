-- LABORATORY WORK 5
-- BY Haluha_Bohdan
Завдання 1

DELIMITER //

DROP PROCEDURE count_orders

CREATE PROCEDURE count_orders (IN i INT, OUT ord_count INT)
  begin
    DECLARE item_count INT
    DROP VIEW IF EXISTS report_orders;
    DECLARE VIEW report_orders AS SELECT orderitems.order_item, orders.cust_id
      orderitems.quantity, orderitems.order_item*orderitems.quantity AS summa
    FROM orderitems, orders
    WHERE orderitems.order_num = orders.order_num;
    SELECT SUM(summa) AS item_count FROM report_orders WHERE cust_id=i
  end
  //
  
  
  SELECT SUM(summa) INTO prod_num FROM report_orders WHERE cust_id=i
