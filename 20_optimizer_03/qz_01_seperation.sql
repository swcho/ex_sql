-- 실행계획 분리 SQL

select COL1, COL2
from TEST
where COL1 = 'A'
and COL2 between '100' and '110';

select COL1, COL2
from TEST
where COL1 = 'A'
and COL2 in ('100', '110');
