
select JOIN_YYYY, count(*)
from PLAYER
where JOIN_YYYY >= '2010'
group by JOIN_YYYY;

select JOIN_YYYY,
  sum(case when POSITION='FW' then 1 else 0 end) FW,
  sum(case when POSITION='MF' then 1 else 0 end) MF,
  sum(case when POSITION='DF' then 1 else 0 end) DF,
  sum(case when POSITION='GK' then 1 else 0 end) GK,
  sum(1) SUM
from PLAYER
where JOIN_YYYY >= '2010'
group by JOIN_YYYY;
