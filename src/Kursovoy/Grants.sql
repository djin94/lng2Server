CREATE ROLE dispetcher;
CREATE ROLE chief;

CREATE USER Zaycev WITH PASSWORD 'zay123';
CREATE USER Kaptilov WITH PASSWORD 'kap123';
CREATE USER Kirienko WITH PASSWORD 'Kir123';
CREATE USER Solovyev WITH PASSWORD 'Solo78';
CREATE USER Kostin WITH PASSWORD 'Kost0';

GRANT chief TO Zaycev;
GRANT dispetcher TO Kaptilov;
GRANT dispetcher TO Kirienko;
GRANT dispetcher TO Solovyev;
GRANT dispetcher TO Kostin;

