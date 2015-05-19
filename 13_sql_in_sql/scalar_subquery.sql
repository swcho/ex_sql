# NOTE: use join primarily

# using in select
select EMPNO, ENAME,
  (select DNAME from DEPT where DEPTNO=A.DEPTNO) DNAME
from EMP A;

# using in function
select EMPNO, ENAME,
  substr((select DNAME from DEPT where DEPTNO=A.DEPTNO),1,3)
from EMP A;

# using in where
select EMPNO, ENAME
from EMP A
where (select DNAME FROM DEPT WHERE DEPTNO=A.DEPTNO) like 'S%';

# using in order by
select EMPNO, ENAME, DEPTNO
from EMP A
order by (select DNAME from DEPT where DEPTNO=A.DEPTNO);