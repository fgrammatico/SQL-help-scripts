exec sp_db_owner 'sa'

ALTER AUTHORIZATION ON DATABASE::VANTAGE TO sa;

ALTER DATABASE VANTAGE  SET TRUSTWORTHY ON;