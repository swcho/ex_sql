
# select JOB, ENAME,SAL,
#   RANK() OVER (ORDER BY SAL DESC) ALL_RANK,
#   RANK() OVER (PARTITION BY JOB ORDER BY SAL DESC) JOB_RANK
# from EMP;

# http://blackbull.tistory.com/43

select JOB, ENAME, SAL, @curRank := @curRank + 1
from EMP, (select @curRank := 0) r
order by SAL;

# http://moinne.com/blog/ronald/oracle/ranking-your-results-using-rank-dense_rank-and-row_number

select JOB, ENAME, SAL,
  RANK() OVER (ORDER BY SAL DESC) RANK,
  DENSE_RANK() OVER (ORDER BY SAL DESC) DENSE_RANK
from EMP;

# Sum with partition by
# http://explainextended.com/2009/03/08/analytic-functions-sum-avg-row_number/