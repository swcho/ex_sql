-- 팀과 스타디움 테이블을 팀 ID로 조인하여 팀이름 팀 ID, 스타디움 이름을 찾아본다.
select t.TEAM_NAME, t.TEAM_ID, s.STADIUM_NAME
from TEAM t join STADIUM s
on t.TEAM_ID=s.HOMETEAM_ID;