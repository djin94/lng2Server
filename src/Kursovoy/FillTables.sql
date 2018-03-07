INSERT INTO TypeND (typend_id, nametypend) VALUES (1,'Методика наладочных работ');
INSERT INTO TypeND (typend_id, nametypend) VALUES (2,'Технические условия');
INSERT INTO TypeND (typend_id, nametypend) VALUES (3,'Руководство эксплуатации');

INSERT INTO ND (nd_id, typend_id, namend, startdate) VALUES (1,1,'Методика наладочных работ для УОИ 27.Т.012-01','2012-04-01');
INSERT INTO ND (nd_id, typend_id, namend, startdate) VALUES (2,2,'Технические условия для УОИ 27.Т.012-01','2012-04-01');
INSERT INTO ND (nd_id, typend_id, namend, startdate) VALUES (3,3,'Руководство эксплуатации для УОИ 27.Т.012-01','2012-04-01');
INSERT INTO ND (nd_id, typend_id, namend, startdate) VALUES (4,1,'Методика наладочных работ для ВТПЕ 27.Т.220-110-02','2015-07-01');
INSERT INTO ND (nd_id, typend_id, namend, startdate) VALUES (5,2,'Технические условия для ВТПЕ 27.Т.220-110-02','2015-07-01');
INSERT INTO ND (nd_id, typend_id, namend, startdate) VALUES (6,3,'Руководство эксплуатации для ВТПЕ 27.Т.220-110-02','2015-07-01');

INSERT INTO TypeProduct (typeproduct_id, nd_id, nametypeproduct,sokrname) VALUES (1,1,'УОИ 27.Т.012-01','Стойка 12');
INSERT INTO TypeProduct (typeproduct_id, nd_id, nametypeproduct,sokrname) VALUES (2,4,'ВТПЕ 27.Т.220-110-1012РМ-02','ВТПЕ 1012');

INSERT INTO Products (serialnumber, typeproduct_id, daterelease, nameproduct,about) VALUES ('0152',1,'2018-1-15','УОИ 27.Т.012-01','УОИ для ТЕП70БС 001');
INSERT INTO Products (serialnumber, typeproduct_id, daterelease, nameproduct,about) VALUES ('0153',1,'2018-1-17','УОИ 27.Т.012-01','УОИ для ТЕП70БС 002');
INSERT INTO Products (serialnumber, typeproduct_id, daterelease, nameproduct,about) VALUES ('0154',1,'2018-1-19','УОИ 27.Т.012-01','УОИ для ТЕП70БС 003');
INSERT INTO Products (serialnumber, typeproduct_id, daterelease, nameproduct,about) VALUES ('0155',1,'2018-1-21','УОИ 27.Т.012-01','УОИ для ТЕП70БС 004');
INSERT INTO Products (serialnumber, typeproduct_id, daterelease, nameproduct,about) VALUES ('0001',2,'2018-1-23','ВТПЕ 27.Т.220-110-1012РМ-02','ВТПЕ для ТЕП70БС 001');
INSERT INTO Products (serialnumber, typeproduct_id, daterelease, nameproduct,about) VALUES ('0002',2,'2018-1-24','ВТПЕ 27.Т.220-110-1012РМ-02','ВТПЕ для ТЕП70БС 002');
INSERT INTO Products (serialnumber, typeproduct_id, daterelease, nameproduct,about) VALUES ('0003',2,'2018-1-25','ВТПЕ 27.Т.220-110-1012РМ-02','ВТПЕ для ТЕП70БС 003');
INSERT INTO Products (serialnumber, typeproduct_id, daterelease, nameproduct,about) VALUES ('0004',2,'2018-1-26','ВТПЕ 27.Т.220-110-1012РМ-02','ВТПЕ для ТЕП70БС 004');

INSERT INTO Status(status_id, namestatus) VALUES (1,'На пуско-наладке');
INSERT INTO Status(status_id, namestatus) VALUES (2,'Ожидает отправки');
INSERT INTO Status(status_id, namestatus) VALUES (3,'В ремонте');
INSERT INTO Status(status_id, namestatus) VALUES (4,'Отправлено');


INSERT INTO Positions (position_id, nameposition) VALUES (1,'Инженер 1к.');
INSERT INTO Positions (position_id, nameposition) VALUES (2,'Инженер 2к.');
INSERT INTO Positions (position_id, nameposition) VALUES (3,'Инженер 3к.');
INSERT INTO Positions (position_id, nameposition) VALUES (4,'Инженер');
INSERT INTO Positions (position_id, nameposition) VALUES (5,'Техник 1к.');
INSERT INTO Positions (position_id, nameposition) VALUES (6,'Техник 2к.');

INSERT INTO Staff(staff_id, position_id, fiosotr,initials) VALUES (1,1,'Зайцев','А.К.');
INSERT INTO Staff(staff_id, position_id, fiosotr,initials) VALUES (2,2,'Каптилов','В.О.');
INSERT INTO Staff(staff_id, position_id, fiosotr,initials) VALUES (3,3,'Кириенко','П.И.');
INSERT INTO Staff(staff_id, position_id, fiosotr,initials) VALUES (4,4,'Соловьев','В.И.');
INSERT INTO Staff(staff_id, position_id, fiosotr,initials) VALUES (5,5,'Костин','К.Е.');

INSERT INTO Tests(test_id, serialnumber, staff_id, status_id, datetest, numberact) VALUES (1,'0152',3,2,'2018-1-16','10152');
INSERT INTO Tests(test_id, serialnumber, staff_id, status_id, datetest, numberact) VALUES (2,'0153',4,2,'2018-1-18','10153');
INSERT INTO Tests(test_id, serialnumber, staff_id, status_id, datetest, numberact,pointnd) VALUES (3,'0154',5,1,'2018-1-20','10154','4.3.1');
INSERT INTO Tests(test_id, serialnumber, staff_id, status_id, datetest, numberact) VALUES (4,'0155',4,3,'2018-1-22','10155');
INSERT INTO Tests(test_id, serialnumber, staff_id, status_id, datetest, numberact) VALUES (5,'0001',5,2,'2018-1-25','20001');
INSERT INTO Tests(test_id, serialnumber, staff_id, status_id, datetest, numberact) VALUES (6,'0002',3,2,'2018-1-26','20002');
INSERT INTO Tests(test_id, serialnumber, staff_id, status_id, datetest, numberact,pointnd) VALUES (7,'0003',5,3,'20003','2018-1-27','5.1.2');
INSERT INTO Tests(test_id, serialnumber, staff_id, status_id, datetest, numberact) VALUES (8,'0004',5,1,'2018-1-28','20004');

INSERT INTO Applicants (applicant_id, nameapplicant, adress, phone, sign) VALUES (1,'ОАО "Коломенский завод"','МО, г. Коломна, ул. Партизан, 42','84966546512',1);
INSERT INTO Applicants (applicant_id, nameapplicant, adress, phone, sign) VALUES (2,'АО "БМЗ"','Брянская обл., г. Брянск, ул. Свешникова, 1','8483261538532',1);
INSERT INTO Applicants (applicant_id, nameapplicant, adress, phone, sign) VALUES (3,'АО "ЛМЗ"','Калужская обл., г. Людиново, ул. Дзержинского, 78','848444788945',1);
INSERT INTO Applicants (applicant_id, nameapplicant, adress, phone, sign) VALUES (4,'ОАО "ВТРЗ"','Воронежская обл., г. Воронеж, ул. Свердлова, 5','84732152485',1);
INSERT INTO Applicants (applicant_id, nameapplicant, adress, phone, sign) VALUES (5,'ООО "ЛД "Екатеринбург 1"','Екатеринбургская обл, г. Екатеринбург, ул. Кропоткина, 7','8343257863',1);

INSERT INTO Supply (supply_id, serialnumber, staff_id, applicant_id, datesupply,numberdoc) VALUES (1,'0152',1,1,'2018-02-01','12154553');
INSERT INTO Supply (supply_id, serialnumber, staff_id, applicant_id, datesupply,numberdoc) VALUES (2,'0153',1,4,'2018-02-03','12154571');
INSERT INTO Supply (supply_id, serialnumber, staff_id, applicant_id, datesupply,numberdoc) VALUES (3,'0001',2,1,'2018-02-01','121545558');
INSERT INTO Supply (supply_id, serialnumber, staff_id, applicant_id, datesupply,numberdoc) VALUES (4,'0002',2,4,'2018-02-03','12154574');

INSERT INTO ReturnProduct (return_id, serialnumber, staff_id, applicant_id, datereturn, numberdoc) VALUES (1,'0152',1,1,'2018-02-10','12154608');

INSERT INTO Movement (mvmn_id, serialnumber, datemvmn, status_id) VALUES (1,'0152','2018-1-15',3);
INSERT INTO Movement (mvmn_id, serialnumber, datemvmn, status_id) VALUES (2,'0153','2018-1-17',4);
INSERT INTO Movement (mvmn_id, serialnumber, datemvmn, status_id) VALUES (3,'0154','2018-1-19',1);
INSERT INTO Movement (mvmn_id, serialnumber, datemvmn, status_id) VALUES (4,'0155','2018-1-21',3);
INSERT INTO Movement (mvmn_id, serialnumber, datemvmn, status_id) VALUES (5,'0001','2018-1-23',4);
INSERT INTO Movement (mvmn_id, serialnumber, datemvmn, status_id) VALUES (6,'0002','2018-1-24',4);
INSERT INTO Movement (mvmn_id, serialnumber, datemvmn, status_id) VALUES (7,'0003','2018-1-25',3);
INSERT INTO Movement (mvmn_id, serialnumber, datemvmn, status_id) VALUES (8,'0004','2018-1-26',1);