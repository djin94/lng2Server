/*1. Триггер, запрещающий добавление проверок с существующим номером акта*/
CREATE FUNCTION NumberActCheck() RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP='Insert' THEN
    IF NEW.numberact IN (SELECT numberact FROM tests) THEN
      RAISE EXCEPTION 'Номер акта существует';
    END IF;
  END IF;
  IF TG_OP='Update' THEN
    IF (new.numberact !=old.numberact) AND (NEW.numberact IN (SELECT numberact FROM tests))THEN
      RAISE EXCEPTION 'Номер акта существует';
    END IF;
  END IF;
  RETURN new;
END
$$  language plpgsql;

CREATE TRIGGER NumberAct BEFORE INSERT OR UPDATE ON tests
FOR EACH ROW EXECUTE PROCEDURE NumberActCheck();

INSERT INTO Tests(test_id, product_id, staff_id, status_id, datetest, numberact) VALUES (9,1,3,2,'2018-1-16','10152');
INSERT INTO Tests(test_id, product_id, staff_id, status_id, datetest, numberact) VALUES (9,1,3,2,'2018-1-16','10160');

/*2. Триггер, запрещающий добавление продукции с существующим номером*/
CREATE FUNCTION SNProdCheck() RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP='Insert' THEN
    IF NEW.serialnumber IN (SELECT serialnumber FROM products WHERE typeproduct_id=NEW.typeproduct_id) THEN
      RAISE EXCEPTION 'Продукция с таким серийным номером уже существует';
    END IF;
  END IF;
  IF TG_OP='Update' THEN
    IF (new.serialnumber!=old.product_id) AND (NEW.serialnumber IN (SELECT serialnumber FROM products WHERE typeproduct_id=NEW.typeproduct_id)) THEN
      RAISE EXCEPTION 'Продукция с таким серийным номером уже существует';
    END IF;
  END IF;
  RETURN new;
END
$$  language plpgsql;

CREATE TRIGGER SNProd BEFORE INSERT OR UPDATE ON products
FOR EACH ROW EXECUTE PROCEDURE SNProdCheck();

INSERT INTO Products (daterelease,typeproduct_id, daterelease) VALUES ('0152',1,'2018-1-15');

/*3. Триггер, запрещающий добавление записи в таблицу Returnproduct, если
дата возврата продукции раньше даты поставки*/
CREATE FUNCTION DateReturnCheck() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.datereturn<(SELECT s.datesupply FROM supply s WHERE s.product_id=new.product_id) THEN
    RAISE EXCEPTION 'Дата возврата должна быть позже или равна дате отправки';
  END IF;
  RETURN new;
END
$$  language plpgsql;

CREATE TRIGGER DateReturn BEFORE INSERT OR UPDATE ON returnproduct
FOR EACH ROW EXECUTE PROCEDURE DateReturnCheck();

INSERT INTO ReturnProduct (return_id, product_id, staff_id, applicant_id, datereturn) VALUES (2,2,1,1,'2018-02-02');

/*4. Триггер, запрещающий добавление записи в таблицу ND, если
дата начала действия нормативного документа позже даты окончания*/
CREATE FUNCTION NDDatesCheck() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.startdate>=NEW.enddate THEN
    RAISE EXCEPTION 'Дата начала действия нормативного документа должна быть раньше даты окончания';
  END IF;
  RETURN new;
END
$$  language plpgsql;

CREATE TRIGGER NDDates BEFORE INSERT OR UPDATE ON ND
FOR EACH ROW EXECUTE PROCEDURE NDDatesCheck();

INSERT INTO ND (nd_id, typend_id, namend, startdate,enddate) VALUES (10,1,'Методика наладочных работ для УОИ 27.Т.012-01','2012-04-01','2011-04-01');

/*5. */


