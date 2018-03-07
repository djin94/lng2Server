
ALTER TABLE ND ADD endDate DATE;

ALTER TABLE TypeProduct DROP sokrname;

ALTER TABLE Products DROP CONSTRAINT Products_pkey CASCADE;

ALTER TABLE Products ADD product_id SERIAL;
ALTER TABLE Products ADD PRIMARY KEY (product_id);

ALTER TABLE Products DROP about;

ALTER TABLE Staff RENAME FIOSotr to FIO;
UPDATE Staff S1 SET FIO=(SELECT FIO||' '||initials FROM staff s2 WHERE s1.staff_id=s2.staff_id);
ALTER TABLE Staff DROP initials;

ALTER TABLE Tests ADD product_id INT REFERENCES Products ON UPDATE CASCADE ON DELETE NO ACTION;
UPDATE Tests T SET product_id=(SELECT product_id FROM products p WHERE p.serialnumber=T.serialnumber);
ALTER TABLE Tests DROP serialnumber;

ALTER TABLE Applicants DROP sign;

ALTER TABLE Supply DROP numberdoc;
ALTER TABLE Supply ADD product_id INT REFERENCES Products ON UPDATE CASCADE ON DELETE NO ACTION;
UPDATE Supply S SET product_id=(SELECT product_id FROM products p WHERE p.serialnumber=S.serialnumber);
ALTER TABLE Supply DROP serialnumber;

ALTER TABLE ReturnProduct DROP numberdoc;
ALTER TABLE ReturnProduct ADD product_id INT REFERENCES Products ON UPDATE CASCADE ON DELETE NO ACTION;
UPDATE ReturnProduct R SET product_id=(SELECT product_id FROM products p WHERE p.serialnumber=R.serialnumber);
ALTER TABLE ReturnProduct DROP serialnumber;

DROP TABLE movement;
ALTER TABLE Tests DROP pointnd;

ALTER TABLE TypeProduct DROP ND_id;

CREATE TABLE BridgeNDTypeProduct (
  bridge_id INT PRIMARY KEY,
  ND_id INT REFERENCES ND ON UPDATE CASCADE ON DELETE NO ACTION,
  typeProduct_id INT REFERENCES TypeProduct ON UPDATE CASCADE ON DELETE NO ACTION
);

ALTER TABLE Products DROP nameproduct;