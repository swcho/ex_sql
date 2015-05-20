
select DNAME, JOB, count(*), sum(SAL)
from EMP, DEPT
where DEPT.DEPTNO=EMP.DEPTNO
group by cube(DNAME,JOB) by 1,2;