-- LABORATORY WORK 4
-- BY Haluha_Bohdan
/*1.Написати тріггер, що при видаленні повідомлень, змінює текст повідомлень на "видалено"*/
CREATE TRIGGER trigg_1
  BEGIN
    UPDATE messeges
    IF SQL% NOT FOUND THEN
      dbms_output.put_line('видалено')
  END;
  
  
  
/*2.При зміні ім'я вендора змінюється його vend_city на 'Київ'*/

DECLARE var_rows number(5)
BEGIN
  UPDATE  vendors
  IF vend_name.change
    SET vendors.vend_city = 'Київ'  
  
