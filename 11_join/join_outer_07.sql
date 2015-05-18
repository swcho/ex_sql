
select e.ENAME, d.DEPTNO, d.DNAME
  from EMP e right outer join DEPT d
      on e.DEPTNO=d.DEPTNO;

select *
  from EMP e right join DEPT d
    on e.DEPTNO = d.DEPTNO;