-- 좌석수 세자리 마다 ,
select TEAM.TEAM_NAME, STADIUM.STADIUM_NAME, TO_CHAR(STADIUM.SEAT_COUNT)
from TEAM join SCHEDULE
  on TEAM.TEAM_ID=SCHEDULE.HOMETEAM_ID;