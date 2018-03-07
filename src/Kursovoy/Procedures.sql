DROP TYPE Type_For_Staffs_Test_For_Month;
CREATE TYPE Type_For_Staffs_Test_For_Month AS (FIO VARCHAR(30), test_id INTEGER, serialNumber VARCHAR (20), nameTypeProduct VARCHAR(30));

SELECT * FROM staffs_test_for_month('',1,2018);

DROP FUNCTION Staffs_Test_For_Month(FIOSt VARCHAR(30), month_D INTEGER, year_D INTEGER);
/*1. Процедура, выводящая список проведенных тестов сотрудником за определенный месяц*/
CREATE TYPE Type_For_Staffs_Test_For_Month AS (FIO VARCHAR(30), test_id INTEGER, serialNumber VARCHAR (20), nameTypeProduct VARCHAR(30));
CREATE FUNCTION Staffs_Test_For_Month(FIOSt VARCHAR(30), month_D INTEGER, year_D INTEGER)
  RETURNS SETOF Type_For_Staffs_Test_For_Month AS $$
DECLARE buf Type_For_Staffs_Test_For_Month;
BEGIN
  FOR buf.fio, buf.test_id, buf.serialNumber, buf.nameTypeProduct IN
  SELECT s.fio, t.test_id, p.serialnumber, tp.nametypeproduct
  FROM ((staff s INNER JOIN tests t USING (staff_id)) INNER JOIN products p USING (product_id)) INNER JOIN typeproduct tp USING (typeproduct_id)
  WHERE (FIOSt=left(s.fio,length(FIOSt))) and (date_part('month',t.datetest)=month_D) and (date_part('year',t.datetest)=year_D)
  ORDER BY t.test_id
  LOOP
    RETURN NEXT buf;
  END LOOP;
  RETURN;
END;
$$ language plpgsql;

/*2. Процедура, выводящая оборудование, поставленное клиенту за определенный месяц*/
CREATE TYPE Type_For_Products_For_Client_At_Month AS (NameApplicant VARCHAR(30), serialNumber VARCHAR (20), nameTypeProduct VARCHAR(30), dateSupply DATE);
DROP FUNCTION Products_For_Client_At_Month(NameApplicant_ VARCHAR(30), month_D INTEGER, year_D INTEGER);
CREATE FUNCTION Products_For_Client_At_Month(NameApplicant_ VARCHAR(30), month_D INTEGER, year_D INTEGER)
  RETURNS SETOF Type_For_Products_For_Client_At_Month AS $$
  DECLARE buf Type_For_Products_For_Client_At_Month;
  BEGIN
    FOR buf.nameApplicant, buf.serialNumber, buf.nameTypeProduct, buf.dateSupply IN
      SELECT a.nameapplicant, p.serialnumber, tp.nametypeproduct, s.datesupply FROM ((supply S INNER JOIN products p USING (product_id)) INNER JOIN typeproduct tp USING (typeproduct_id)) INNER JOIN applicants A USING (applicant_id)
      WHERE (lower(a.nameapplicant) SIMILAR TO ('%'||lower(NameApplicant_)||'%')) and (date_part('month',s.datesupply)=month_D) and (date_part('year',s.datesupply)=year_D)
      ORDER BY a.nameapplicant
      LOOP
      RETURN NEXT buf;
    END LOOP;
    RETURN;
  END;
  $$ language plpgsql;

SELECT * FROM Products_For_Client_At_Month('втрз', 2, 2018);

/*3. Процедура, показывающая процент брака для каждого типа оборудования за определенный месяц*/
CREATE TYPE Type_For_Returns_Products_At_Month AS (nameTypeProduct VARCHAR(30), PercentDefect REAL);
DROP FUNCTION Returns_Products_At_Month(month_D INTEGER, year_D INTEGER);
CREATE FUNCTION Returns_Products_At_Month(month_D INTEGER, year_D INTEGER)
  RETURNS SETOF Type_For_Returns_Products_At_Month AS $$
DECLARE buf Type_For_Returns_Products_At_Month;
  DECLARE countReturn REAL;
  DECLARE countSupply REAL;
BEGIN
  FOR buf.nameTypeProduct,countReturn, countSupply IN
  SELECT tp.nametypeproduct,cast((SELECT count(*) FROM (returnproduct INNER JOIN products p USING (product_id)) INNER JOIN supply s USING (product_id)
  WHERE (tp.typeproduct_id=p.typeproduct_id) AND (date_part('month',s.datesupply)=month_D) and (date_part('year',s.datesupply)=year_D)) AS DECIMAL),
    (SELECT count(*) FROM products p INNER JOIN supply s USING (product_id)
    WHERE (tp.typeproduct_id=p.typeproduct_id) AND (date_part('month',s.datesupply)=month_D) and (date_part('year',s.datesupply)=year_D))
  FROM  typeproduct tp
  ORDER BY tp.nametypeproduct
  LOOP
    IF countSupply>0 THEN buf.percentdefect=countReturn/countSupply;
    ELSE buf.percentdefect=0;
    END IF;
    RETURN NEXT buf;
  END LOOP;
  RETURN;
END;
$$ language plpgsql;

SELECT tp.nametypeproduct,
  cast((SELECT count(*) FROM returnproduct INNER JOIN products p USING (product_id) WHERE (tp.typeproduct_id=p.typeproduct_id))/
       (SELECT count(*) FROM products p WHERE tp.typeproduct_id=p.typeproduct_id) AS REAL)
FROM  typeproduct tp;

SELECT * FROM returns_products_at_month(1,2018);