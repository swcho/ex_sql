
select ENAME, case when SAL>2000
    then SAL
    else 2000
  end as REVISED_SALARY
from EMP;

select ENAME, SAL, case when SAL > 2000
  then 1000
  else (case when SAL > 1000
    then 500
    else 0
      end)
  end as BONUS
from EMP;

select
  (case when DEPTNO < 20
    then 'Part I'
    else 'Part II'
   end) as GRAND_PART,
  avg
  (case when SAL > 2000
    then SAL
    else
      (case when SAL > 1500
        then 1000
        else 0
          end)
    end) as REVISED_SALARY
from EMP
group by
  (case when DEPTNO < 20
    then 'Part I'
    else 'Part II'
      end)
