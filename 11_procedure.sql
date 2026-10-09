CREATE PROCEDURE get_sales_between(
    start_date DATE,
    end_date DATE
) LANGUAGE plpgsql AS $procedure$
DECLARE v_sales NUMERIC(9,2);
BEGIN
SELECT SUM(sales) INTO v_sales FROM orders WHERE order_date>=start_date AND order_date<=end_date;
RAISE NOTICE 'sales % during % - %',v_sales,start_date,end_date;
END;
$procedure$;

CALL get_sales_between('2024-01-01', '2024-03-31');

DROP PROCEDURE get_sales_between(start_date DATE, end_date DATE);