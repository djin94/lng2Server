GRANT SELECT ON staff TO Staffs_Test_For_Month(FIOSt VARCHAR(30), month_D INTEGER, year_D INTEGER);
GRANT SELECT ON products TO Staffs_Test_For_Month(FIOSt VARCHAR(30), month_D INTEGER, year_D INTEGER);
GRANT SELECT ON tests TO Staffs_Test_For_Month(FIOSt VARCHAR(30), month_D INTEGER, year_D INTEGER);
GRANT SELECT ON typeproduct TO Staffs_Test_For_Month(FIOSt VARCHAR(30), month_D INTEGER, year_D INTEGER);

/*Создание ролей*/
CREATE ROLE dispetcher;
CREATE ROLE tester;
CREATE ROLE chief;

DROP USER zaycev;
DROP USER kaptilov;
DROP USER kirienko;
DROP USER kostin;
DROP USER solovyev;

/*Создание пользователей*/
CREATE USER Zaycev WITH PASSWORD 'zay123';
CREATE USER Kaptilov WITH PASSWORD 'kap123';
CREATE USER Kirienko WITH PASSWORD 'Kir123';
CREATE USER Solovyev WITH PASSWORD 'Solo78';
CREATE USER Kostin WITH PASSWORD 'Kost0';

/*Присвоение пользователям ролей*/
GRANT chief TO Zaycev;
GRANT dispetcher TO Kaptilov;
GRANT tester TO Kirienko;
GRANT tester TO Solovyev;
GRANT tester TO Kostin;

/*Передача прав на использование необходимых таблиц и процедур диспетчеру*/

GRANT ALL ON products TO dispetcher;
GRANT SELECT ON tests TO dispetcher;
GRANT ALL ON supply TO dispetcher;
GRANT ALL ON returnproduct TO dispetcher;
GRANT SELECT ON staff TO dispetcher;
GRANT SELECT ON applicants TO dispetcher;
GRANT SELECT ON status TO dispetcher;
GRANT SELECT ON typeproduct TO dispetcher;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO dispetcher;

/*Передача прав на использование необходимых таблиц и процедур тестеру*/

GRANT SELECT ON products TO tester;
GRANT ALL ON tests TO tester;
GRANT SELECT ON supply TO tester;
GRANT SELECT ON returnproduct TO tester;
GRANT SELECT ON staff TO tester;
GRANT SELECT ON applicants TO tester;
GRANT SELECT ON status TO tester;
GRANT SELECT ON typeproduct TO tester;
GRANT EXECUTE ON FUNCTION Staffs_Test_For_Month(FIOSt VARCHAR(30), month_D INTEGER, year_D INTEGER) TO tester;

/*Передача прав на использование необходимых таблиц и процедур начальнику ОКК*/

GRANT SELECT ON typend TO chief;
GRANT SELECT ON nd TO chief;
GRANT SELECT ON positions TO chief;
GRANT SELECT ON typeproduct TO chief;
GRANT SELECT ON status TO chief;
GRANT SELECT ON staff TO chief;
GRANT SELECT ON products TO chief;
GRANT SELECT ON applicants TO chief;
GRANT SELECT ON bridgendtypeproduct TO chief;
GRANT SELECT ON tests TO chief;
GRANT ALL ON supply TO chief;
GRANT SELECT ON returnproduct TO chief;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO dispetcher;
