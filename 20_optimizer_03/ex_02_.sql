
-- 8월 한달 동안의 경기장 별 일정 및 결과

select *
from SCHEDULE_T
where GUBUN='Y'
and SCHE_DATE between '20120801' and '20120831';

-- table access by index rowid:scott.emp
---- index range scan:scott.emp_x2

select *
from SCHEDULE_T
where GUBUN='Y'
and STADIUM_ID in (select  STADIUM_ID from STADIUM_T)
and SCHE_DATE between '20120801' and '20120831';

-- nested loops
---- table access by index rowid:schedule
------ index range scan:schedule_pk
---- index unique scan:stadium_pk

-- 서브 쿼리를 사용하여 in 조건을 추가: 서브 쿼리가 반드시 driving 테이블.

select *
from SCHEDULE_T
where GUBUN='Y'
and STADIUM_ID in (select STADIUM_ID||'' from STADIUM_T)
and SCHE_DATE between '20120801' and '20120831';

-- view sys
---- sort unique
------ table access by index rowid:schedule
-------- nested loops
---------- table access full:stadium
---------- index range scan:schedule_pk
