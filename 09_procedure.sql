CREATE PROCEDURE get_customer_sales(p_customer_id VARCHAR(20))
LANGUAGE plpgsql
AS $procedure$
DECLARE customer_total NUMERIC(9,2);
BEGIN
SELECT SUM(sales) INTO customer_total FROM orders WHERE customer_id = p_customer_id;
RAISE NOTICE '% - %',p_customer_id, customer_total; 
END;
$procedure$;

CALL get_customer_sales('C001');

DROP PROCEDURE get_customer_sales(p_customer_id VARCHAR(20));