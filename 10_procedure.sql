CREATE PROCEDURE apply_regional_discount(
    region_name VARCHAR(20),
    discount_rate NUMERIC(3,2)
) LANGUAGE plpgsql AS $procedure$
BEGIN
UPDATE orders SET sales = sales*(1-discount_rate) WHERE region = region_name;
RAISE NOTICE 'region - %, sale - % percent',region_name, discount_rate*100;
END;
$procedure$;

SELECT sales FROM orders WHERE region='West';

CALL apply_regional_discount('West', 0.10);

DROP PROCEDURE apply_regional_discount(
    region_name VARCHAR(20),
    discount_rate NUMERIC(3,2)
)