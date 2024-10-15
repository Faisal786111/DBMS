-- 1. How to create a user on localhost.

-- Syntax : 
CREATE USER [user_name]@[<localhost> | <IP adress> | <any host('%')>] 
IDENTIFIED BY ["password"];

-- Example : 
CREATE USER samay@localhost 
IDENTIFIED BY "samay1";

-- 2. How to create a user for an IP address other than localhost.

-- Syntax : 
CREATE USER [user_name]@[<localhost>| <IP address> | <any host('%')>]
IDENTIFIED BY ["password"];

-- Example :
CREATE USER harsha@Ipaddress
IDENTIFIED BY "harsha1";

-- 3. How to grant permission to a user to select only from localhost.

-- Syntax : 
GRANT [<permission1 , permission2 , permissionN> | <All>] 
ON [Database].[<table_name> | <all_tables(*)>]
TO [user_name]@[<localhost>| <IP address> | <any host('%')>];

-- Example : 
GRANT SELECT 
ON hr.*
TO samay@localhost;

-- 4. How to grant a user permission to create, insert, update, delete and create 
-- temporary tables from localhost.

-- Syntax : 
GRANT [<permission1 , permission2 , permissionN> | <All>]
ON [database].[<table_name> | <all_tables(*)>]
TO [user_name]@[<localhost> | <IP address> | <any host('%')];

-- Example : 
GRANT SELECT , INSERT , UPDATE , DELETE , CREATE TEMPORARY TABLES 
ON views.*
TO samay@localhost;

-- 5. How to grant a user permission to create, insert, update, delete and create 
-- temporary tables from any host.

-- Syntax : 
GRANT [<permission1 , permission2 , permissionN> | <All>]
ON [Database].[<table_name> | <all_tables(*)>]
TO [user_name]@[<localhost> | <IP address> | <any host('%')>];

-- Example : 
GRANT SELECT , INSERT , UPDATE , DELETE , CREATE TEMPORARY TABLES
ON views.*
TO harsha@'%';

-- 6. How to grant a user permission to select only from any host but to a specific table of a database.

-- Syntax : 
GRANT [<permission1 , permission2 , permissionN> | <all>]
ON [Database].[<table_name> | <all_tables(*)>]
TO [user_name]@[<localhost> | <ip address> | <any host('%')>];

-- Example : 
GRANT select 
ON views.EMPLOYEE
TO harsha@'%';

-- 7. How to grant all privileges to a user from all machines.
-- Syntax : 
GRANT [<permission1 , permission2 , permissionN> | <all>]
ON [Database].[<table_name> | <all_tables(*)>]
TO [user_name]@[<localhost> | <ip address> | <any host('%')>];

-- EXAMPLE : 
GRANT ALL privileges
ON VIEWS.* 
TO harsha@'%';

-- 8. How to revoke all privileges from a user.

-- Syntax : 
REVOKE [<permission1 , permission2 , permissionN> | <ALL>]
ON [Database].[<table_name> | <all_tables(*)>]
FROM [user_name]@[<localhost> | <IP adress> | <ANY host ('%')>];

-- Example : 
REVOKE ALL PRIVILEGES 
ON views.* 
FROM samay@localhost;

-- 9. How to revoke specific privilege from a user.

-- Syntax : 
REVOKE [<permission1 , permission2 , permissionN> | <ALL>]
ON [Database].[<table_name> | <all_tables(*)>]
FROM [user_name]@[<localhost> | <IP adress> | <ANY host ('%')>];

-- Example : 
REVOKE SELECT
ON HR.* 
FROM samay@localhost;

-- 10. How to check permissions granted to a specific user.

-- Syntax : 
SHOW GRANTS FOR [user_name]@[<localhost> | <ip address> | <ANY host ('%')>];

-- EXAMPLE 
SHOW GRANTS FOR samay@localhost;

-- 11. How to check the list of system privileges that the MySQL server supports.

SHOW PRIVILEGES;

-- 12. How to Grant permission to a user so that (s)he can execute not more than a 
-- specific number of queries in an hour.

CREATE USER amit@localhost 
IDENTIFIED BY 'amit1';

GRANT ALL PRIVILEGES
ON HR.*
TO amit@localhost;

-- LILMIT ON QUERIES
-- Syntax : 
ALTER USER [user_name]@[<localhost>|<ip address> |<any host('%')>]
WITH MAX_QUERIES_PER_HOUR 50;

-- Example :
ALTER USER amit@localhost
WITH MAX_QUERIES_PER_HOUR 50;

-- 13. How to change the password of user.

-- Syntax : 
ALTER USER [user_name]@[<localhost>|<ip address> |<any host('%')>] 
IDENTIFIED BY "new_password";

-- Example : 
ALTER USER samay@localhost
IDENTIFIED BY "samay786";

-- 14. How to delete user.

-- Syntax : 
DROP USER [user_name]@[<localhost> | <IP address> | <ANY host('%')>];

-- Example : 
DROP USER amit@localhost;

-- 15. How to rename a user.
-- Syntax : 
RENAME  USER [user_name]@[<localhost> | <IP address> | <ANY host('%')>] to [new_user_name]@[<localhost>|<IP address> | <any host ('%')>];

-- Example : 
RENAME USER 'samay'@'locahost' TO 'samayRaina'@'locahost';

-- 16. How to create a user and granting no privileges
-- Syntax : 
CREATE USER ['user_name']@[<'locahost' > |<'IP address'> |<ANY HOST('%')]
IDENTIFIED BY ['password'];

SHOW GRANTS FOR ['user_name']@[<'locahost' > |<'IP address'> |<ANY HOST('%')];

-- Example :
CREATE USER 'amit'@'localhost'
IDENTIFIED BY "amit1";

SHOW GRANTS FOR 'amit'@'locahost';