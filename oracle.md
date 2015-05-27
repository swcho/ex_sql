https://registry.hub.docker.com/u/alexeiled/docker-oracle-xe-11g/

ssh root@localhost -p 49160
password: admin

$ sqlplus

system/oracle

CREATE USER TEST_USER IDENTIFIED BY TEST;
GRANT CREATE SESSION TO TEST_USER;
GRANT CREATE TABLE TO TEST_USER;
ALTER USER TEST_USER QUOTA 100M on SYSTEM;

SELECT * FROM DBA_ROLES;
grant CONNECT to TEST_USER;
grant RESOURCE to TEST_USER;
grant create procedure to TEST_USER;

GRANT PLUSTRACE TO TEST_USER;