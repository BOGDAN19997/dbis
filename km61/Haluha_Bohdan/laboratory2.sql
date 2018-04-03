/*---------------------------------------------------------------------------
1. Вивести ключ покупця та ключ покупця та кількість куплених покупцем продуктів у постачальника.

---------------------------------------------------------------------------*/
--Код відповідь:
SELECT
  CUSTOMERS.CUST_NAME
  VENDORS.VEND_ID
  ORDERS.ORDER_NUM
  SUM(ORDERITEMS.ORDER_ITEM*ORDERITEMS.ITEM_PRICE) as ORDERS.ORDER_SUM
  FROM
    CUSTOMERS
    JOIN ORDERS
    ON CUSTOMERS.CUST_ID = ORDERS.CUST_ID
    JOIN ORDERITEMS
    ON ORDERS.ORDER_NUM = ORDERITEMS.ORDER_NUM
  GROUP BY ORDERS.ORDER_NUM, CUSTOMERS.CUST_NAME;
  HAVING COUNT ()
  
/* --------------------------------------------------------------------------- 
2.  Вивести ключ постачальника на номери замовлень, що містять по 2 куплених його товарів.

---------------------------------------------------------------------------*/
--Код відповідь:
SELECT
  VENDORS.CUST_ID
  ORDERS.PROD_ID
  FROM
    VENDORS
    JOIN ORDERS
    ON VENDORS.CUST_ID = ORDERS.CUST_ID
    JOIN ORDERITEMS
    ON ORDERS.ORDER_NUM = ORDERITEMS.ORDER_NUM
  GROUP BY VENDORS.CUST_NAME;
 HAVING COUNT( ORDERITEMS.QUANTITY = 2)
