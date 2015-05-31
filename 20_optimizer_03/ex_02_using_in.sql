
select DEPTNO, JOB, EMPNO
from EMP
where job='MANAGER'
and DEPTNO between '10' and '20'

-- table access by index rowid:scott.emp
---- index range scan:scott.emp_x2

select DEPTNO, JOB, EMPNO
from EMP
where JOB='MANAGER'
and DEPTNO in ('10', '20')

-- concatenation
---- table access by index rowid:scott.emp
------ index range scan:scott.emp_x2
---- table access by index rowid:scott.emp
------ index range scan:scott.emp_x2
