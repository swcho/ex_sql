
# select DNAME, JOB, COUNT(*) 'Total Empl', SUM(SAL) 'Total Sal'
# from EMP, DEPT
# where DEPT.DEPTNO=EMP.DEPTNO
# group by rollup (DNAME, JOB);

select DNAME, JOB, COUNT(*) 'Total Empl', SUM(SAL) 'Total Sal'
from EMP, DEPT
where DEPT.DEPTNO=EMP.DEPTNO
group by DNAME, JOB with rollup;

select
  DNAME, grouping(DANME),
  JOB, grouping(JOB),
  COUNT(*) 'Total Empl',
  SUM(SAL) 'Total Sal'
from EMP, DEPT
where DEPT.DEPTNO=EMP.DEPTNO
group by DNAME, JOB with rollup;

select DNAME, JOB, MGR, SUM(SAL) 'Total Sal'
from EMP, DEPT
where DEPT.DEPTNO=EMP.DEPTNO
group by DNAME, (JOB, MGR) with rollup;